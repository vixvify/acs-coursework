const checkAge = (age) => {
  return new Promise((resolve, reject) => {
    if (age >= 18) {
      resolve("Allowed");
    } else {
      reject("Not allowed");
    }
  });
};

checkAge(20)
  .then(() => {
    console.log("อายุมากกว่า 18 ปี");
  })
  .catch(() => {
    console.log("อายุน้อยกว่า 18 ปี");
  });
