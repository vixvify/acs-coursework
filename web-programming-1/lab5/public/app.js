const form = document.querySelector("#course-form");
const nameInput = document.querySelector("#course-name");
const creditsInput = document.querySelector("#course-credits");

const courseList = document.querySelector("#course-list");
const emptyMessage = document.querySelector("#empty-message");
const statusBox = document.querySelector("#status");

const addButton = document.querySelector("#add-button");
const refreshButton = document.querySelector("#refresh-button");

const formTitle = document.querySelector("#form-title");
const cancelEditButton = document.querySelector("#cancel-edit-button");

let editingCourseId = null;

function showStatus(message, type = "") {
  statusBox.textContent = message;
  statusBox.className = `status ${type}`;
}

function startEditing(course) {
  editingCourseId = course.id;

  formTitle.textContent = `Edit Course #${course.id}`;
  nameInput.value = course.name;
  creditsInput.value = course.credits;

  addButton.textContent = "Save Changes";
  cancelEditButton.hidden = false;

  nameInput.focus();
}

function resetFormMode() {
  editingCourseId = null;

  formTitle.textContent = "Add New Course";
  addButton.textContent = "Add Course";
  cancelEditButton.hidden = true;

  form.reset();
}

function renderCourses(courses) {
  courseList.replaceChildren();
  emptyMessage.hidden = courses.length > 0;
  for (const course of courses) {
    const row = document.createElement("tr");

    const idCell = document.createElement("td");
    idCell.textContent = course.id;

    const nameCell = document.createElement("td");
    nameCell.textContent = course.name;

    const creditsCell = document.createElement("td");
    creditsCell.textContent = course.credits;

    const actionsCell = document.createElement("td");

    const editButton = document.createElement("button");
    editButton.textContent = "Edit";
    editButton.className = "edit-button";

    editButton.addEventListener("click", () => {
      startEditing(course);
    });

    const deleteButton = document.createElement("button");
    deleteButton.textContent = "Delete";
    deleteButton.className = "delete-button";

    deleteButton.addEventListener("click", () => {
      deleteCourse(course);
    });

    const actions = document.createElement("div");
    actions.className = "actions";

    actions.append(editButton, deleteButton);
    actionsCell.appendChild(actions);

    row.append(idCell, nameCell, creditsCell, actionsCell);
    courseList.appendChild(row);
  }
}

async function loadCourses() {
  refreshButton.disabled = true;
  showStatus("Loading courses...", "loading");

  try {
    const response = await fetch("/api/courses");

    if (!response.ok) {
      throw new Error(`Failed to load courses (HTTP ${response.status})`);
    }

    const courses = await response.json();

    if (!Array.isArray(courses)) {
      throw new Error("Invalid API response format");
    }

    renderCourses(courses);

    showStatus(`Successfully loaded ${courses.length} courses.`, "success");
    return true;
  } catch (error) {
    console.error("GET courses failed:", error);
    showStatus(error.message, "error");
    return false;
  } finally {
    refreshButton.disabled = false;
  }
}

async function createCourse(name, credits) {
  const response = await fetch("/api/courses", {
    method: "POST",

    headers: {
      "Content-Type": "application/json",
    },

    body: JSON.stringify({
      name: name,
      credits: credits,
    }),
  });

  if (!response.ok) {
    let message = `HTTP error ${response.status}`;

    try {
      const errorData = await response.json();

      if (typeof errorData.error === "string") {
        message = errorData.error;
      }
    } catch {}

    throw new Error(message);
  }
  return response.json();
}

async function updateCourse(id, name, credits) {
  const response = await fetch(`/api/courses/${id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ name, credits }),
  });

  if (!response.ok) {
    const data = await response.json().catch(() => ({}));
    throw new Error(data.error || `HTTP error ${response.status}`);
  }

  return response.json();
}

async function deleteCourse(course) {
  const confirmed = confirm(
    `Are you sure you want to delete "${course.name}"?`,
  );

  if (!confirmed) return;

  try {
    const response = await fetch(`/api/courses/${course.id}`, {
      method: "DELETE",
    });

    if (!response.ok) {
      const data = await response.json().catch(() => ({}));
      throw new Error(data.error || `HTTP error ${response.status}`);
    }

    if (editingCourseId === course.id) {
      resetFormMode();
    }

    const refreshed = await loadCourses();

    if (refreshed) {
      showStatus(`Course "${course.name}" deleted successfully.`, "success");
    } else {
      showStatus(
        "Course deleted, but the list could not be refreshed.",
        "error",
      );
    }
  } catch (error) {
    console.error(error);
    showStatus(error.message, "error");
  }
}

form.addEventListener("submit", async (event) => {
  event.preventDefault();

  const name = nameInput.value.trim();
  const credits = Number(creditsInput.value);

  if (
    name.length === 0 ||
    name.length > 150 ||
    !Number.isInteger(credits) ||
    credits < 1 ||
    credits > 6
  ) {
    showStatus("Please enter valid course data.", "error");
    return;
  }

  const isEditing = editingCourseId !== null;

  addButton.disabled = true;
  showStatus(
    isEditing ? "Updating course..." : "Creating course...",
    "loading",
  );

  try {
    const newCourse = isEditing
      ? await updateCourse(editingCourseId, name, credits)
      : await createCourse(name, credits);

    resetFormMode();

    const refreshed = await loadCourses();

    if (refreshed) {
      showStatus(
        `Course "${newCourse.name}" ${
          isEditing ? "updated" : "created"
        } successfully.`,
        "success",
      );
    } else {
      showStatus("Course saved, but the list could not be refreshed.", "error");
    }
  } catch (error) {
    console.error("POST course failed:", error);
    showStatus(error.message, "error");
  } finally {
    addButton.disabled = false;
  }
});

refreshButton.addEventListener("click", loadCourses);

cancelEditButton.addEventListener("click", () => {
  resetFormMode();
  showStatus("Editing cancelled.");
});

loadCourses();
