const profileData = {
  id: 1,
  name: "John Doe",
};

const notificationData = [
  { id: 1, userId: 1, message: "Notification 1" },
  { id: 2, userId: 2, message: "Notification 2" },
  { id: 3, userId: 3, message: "Notification 3" },
];

const productsData = [
  { id: 1, name: "Product 1", price: 10 },
  { id: 2, name: "Product 2", price: 20 },
  { id: 3, name: "Product 3", price: 30 },
];

const recommendationData = [
  { id: 1, userId: 1, recommendations: ["Product 1", "Product 2"] },
  { id: 2, userId: 2, recommendations: ["Product 3"] },
  { id: 3, userId: 3, recommendations: ["Product 1", "Product 3"] },
];

const fetchProfile = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(profileData);
      reject("Error retrieving profile data");
    }, 2000);
  });
};

const fetchNotifications = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(notificationData);
      reject("Error retrieving notification data");
    }, 2000);
  });
};

const fetchProducts = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(productsData);
      reject("Error retrieving products data");
    }, 2000);
  });
};

const fetchRecommendations = (userId) => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const res = recommendationData.filter((item) => item.userId === userId);
      resolve(res);
      reject("Error retrieving recommendations data");
    }, 2000);
  });
};

const setLoading = (isLoading) => {
  console.log(isLoading ? "Loading..." : "Done");
};

const fetchData = async () => {
  setLoading(true);

  try {
    const user = await fetchProfile();

    const results = await Promise.allSettled([
      fetchNotifications(),
      fetchProducts(),
      fetchRecommendations(user.id),
    ]);

    const [notifications, products, recommendations] = results;

    console.log("Profile:", user);

    if (notifications.status === "fulfilled") {
      console.log("Notifications:", notifications);
    } else {
      console.log("Notifications: Error retrieving notification data");
    }

    if (products.status === "fulfilled") {
      console.log("Products:", products);
    } else {
      console.log("Products: Error retrieving products data");
    }
    if (recommendations.status === "fulfilled") {
      console.log("Recommendations:", recommendations);
    } else {
      console.log("Recommendations: Error retrieving recommendations data");
    }
  } catch {
    console.log("Please Try Again");
  } finally {
    setLoading(false);
  }
};
