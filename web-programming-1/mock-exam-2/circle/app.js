const parent = document.getElementById("parent");
const child_1 = document.getElementById("child-1");
const child_2 = document.getElementById("child-2");
const btn = document.getElementById("btn");

parent.addEventListener("click", () => {
  parent.classList.toggle("active");
});

child_1.addEventListener("click", () => {
  child_1.classList.toggle("active");
});

child_2.addEventListener("click", () => {
  child_2.classList.toggle("active");
});

btn.addEventListener("click", () => {
  parent.classList.remove("active");
  child_1.classList.remove("active");
  child_2.classList.remove("active");
});
