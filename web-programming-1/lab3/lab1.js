const loadData = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve("Completed");
      reject("Error");
    }, 2000);
  });
};

const processData = async () => {
  console.log("Loading....");
  await loadData();
  console.log("Data Loaded");
};

processData();
