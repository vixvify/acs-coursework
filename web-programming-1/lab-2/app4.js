const createItemManager = () => {
  let items = [];

  const addItem = (item) => {
    if (items.includes(item)) {
      throw new Error("Item already exists");
    }
    items.push(item);
  };

  const removeItem = (item) => {
    const idx = items.indexOf(item);
    if (idx === -1) {
      throw new Error("Item not found");
    }
    items.splice(idx, 1);
  };

  const listItems = () => {
    return items;
  };

  return {
    addItem,
    removeItem,
    listItems,
  };
};
