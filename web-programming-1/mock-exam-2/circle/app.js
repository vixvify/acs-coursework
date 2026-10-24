const parent = document.getElementById("parent");
const child_1 = document.getElementById("child-1");
const child_2 = document.getElementById("child-2");
const btn = document.getElementById("btn");

parent.addEventListener("click", (event) => {
  if (event.target.classList.value.includes("parent")) {
    parent.classList.toggle("active");
    child_1.classList.remove("active");
    child_2.classList.remove("active");
  } else if (event.target.classList.value.includes("child-1")) {
    const active = parent.classList.contains("active");

    if (!active) parent.classList.add("active");
    if (active && child_1.classList.contains("active")) {
      parent.classList.remove("active");
    }
    child_1.classList.toggle("active");
    child_2.classList.remove("active");
  } else {
    const parent_active = parent.classList.contains("active");
    const child1_active = child_1.classList.contains("active");

    if (!parent_active) parent.classList.add("active");
    if (!child1_active) child_1.classList.add("active");

    if (
      parent_active &&
      child1_active &&
      child_2.classList.contains("active")
    ) {
      parent.classList.remove("active");
      child_1.classList.remove("active");
    }

    child_2.classList.toggle("active");
  }
});

btn.addEventListener("click", () => {
  parent.classList.remove("active");
  child_1.classList.remove("active");
  child_2.classList.remove("active");
});
