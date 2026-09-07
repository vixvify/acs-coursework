const createBankAccount = (initialBalance) => {
  let balance = initialBalance;

  const getBalance = () => {
    return balance;
  };

  const deposit = (amount) => {
    if (amount < 0) {
      throw new Error("Deposit amount must be positive");
    }
    balance += amount;
  };

  const withdraw = (amount) => {
    if (amount < 0) {
      throw new Error("Withdrawal amount must be positive");
    }
    if (amount > balance) {
      throw new Error("Insufficient funds");
    }
    balance -= amount;
  };

  return {
    getBalance,
    deposit,
    withdraw,
  };
};
