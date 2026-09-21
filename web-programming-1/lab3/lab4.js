const userData = [
  { id: 1, name: "Alice" },
  { id: 2, name: "Bob" },
  { id: 3, name: "Charlie" },
];

const orderData = [
  { id: 1, userId: 1, items: ["Order 1", "Order 2"] },
  { id: 2, userId: 2, items: ["Order 3", "Order 4"] },
  { id: 3, userId: 3, items: ["Order 5", "Order 6"] },
];

const notificationData = [
  { id: 1, userId: 1, message: "Notification 1" },
  { id: 2, userId: 2, message: "Notification 2" },
  { id: 3, userId: 3, message: "Notification 3" },
];

const getUser = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(userData);
      reject("Error retrieving data");
    }, 2000);
  });
};

const getOrders = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(orderData);
      reject("Error retrieving orders");
    }, 2000);
  });
};

const getNotifications = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(notificationData);
      reject("Error retrieving order details");
    }, 2000);
  });
};

const setloading = (isLoading) => {
  console.log(isLoading ? "Loading..." : "Done");
};

async function fetchData() {
  try {
    setloading(true);
    const [users, orders, notifications] = await Promise.all([
      getUser(),
      getOrders(),
      getNotifications(),
    ]);

    console.log("Users:", users);
    console.log("Orders for user 1:", orders);
    console.log("Notifications for user 1:", notifications);
  } catch {
    console.log("Error occurred while fetching data, please try again later.");
  } finally {
    setloading(false);
  }
}

fetchData();
