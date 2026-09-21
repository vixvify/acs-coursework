const userData = [
  { id: 1, name: "Alice" },
  { id: 2, name: "Bob" },
  { id: 3, name: "Charlie" },
];

const productsData = [
  { id: 1, userId: 1, items: ["Product 1", "Product 2"] },
  { id: 2, userId: 2, items: ["Product 3", "Product 4"] },
  { id: 3, userId: 3, items: ["Product 5", "Product 6"] },
];

const notificationData = [
  { id: 1, userId: 1, message: "Notification 1" },
  { id: 2, userId: 2, message: "Notification 2" },
  { id: 3, userId: 3, message: "Notification 3" },
];

const getUsers = () => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(userData);
    }, 2000);
  });
};

const getProducts = () => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(productsData);
    }, 2000);
  });
};

const getNotifications = () => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(notificationData);
    }, 2000);
  });
};

const setloading = (isLoading) => {
  console.log(isLoading ? "Loading..." : "Done");
};

async function fetchData() {
  try {
    setloading(true);
    const [users, products, notifications] = await Promise.all([
      getUsers(),
      getProducts(),
      getNotifications(),
    ]);

    console.log("Users:", users);
    console.log("Products:", products);
    console.log("Notifications:", notifications);
  } catch {
    console.log("Error occurred while fetching data, please try again later.");
  } finally {
    setloading(false);
  }
}

fetchData();
