const balance = document.getElementById("balance");
const deposit = document.getElementById("deposit");
const withdraw = document.getElementById("withdraw");
const input = document.getElementById("input");
const error = document.getElementById("error");

let current_amount = 1000;

function initial() {
  balance.innerText = format(current_amount);
}

function format(amount) {
  return `฿${amount}`;
}

deposit.addEventListener("click", () => {
  const value = document.getElementById("input").value;
  error.innerText = "";

  if (Number(value) <= 0) {
    error.innerText = "เงินฝากต้องมากกว่าหรือเท่ากับ 0";
    return;
  }

  current_amount += Number(value);
  balance.innerText = format(current_amount);
  input.value = "";
});

withdraw.addEventListener("click", () => {
  const value = document.getElementById("input").value;
  error.innerText = "";

  if (Number(value) <= 0) {
    error.innerText = "เงินถอนต้องมากกว่าหรือเท่ากับ 0";
    return;
  }

  if (Number(value) > current_amount) {
    error.innerText = "เงินในบัญชีมีไม่เพียงพอ";
    return;
  }

  current_amount -= Number(value);
  balance.innerText = format(current_amount);
  input.value = "";
});

initial();
