const container = document.getElementById("container");

container.addEventListener("click", (event) => {
  if (event.target.classList.value.includes("btn-arrow")) {
    event.target.parentElement.parentElement.classList.toggle("active");
    event.target.classList.toggle("btn-active");
  }
});
