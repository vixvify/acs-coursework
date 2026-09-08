const increment = () => {
  box.textContent = parseInt(box.textContent) + 1;
};

const reset = () => {
  box.textContent = 0;
  if (box.classList.contains("active")) {
    box.classList.remove("active");
  }
};

const toggle = () => {
  box.classList.toggle("active");
};

const box = document.querySelector("#counter-box");
const btnIncrease = document.querySelector("#btn-increase");
const btnReset = document.querySelector("#btn-reset");
const btnToggle = document.querySelector("#btn-toggle");
btnIncrease.addEventListener("click", increment);
btnReset.addEventListener("click", reset);
btnToggle.addEventListener("click", toggle);
