const RandomMachine = (current, limit, threshold = 0) => {
  const totalLimit = limit + threshold;

  let change = totalLimit * (Math.random() * 2 - 1);
  if (Math.abs(change) > limit) change = 0;
  const newData = parseFloat(current) + change;
  return newData;
};

module.exports = RandomMachine;
