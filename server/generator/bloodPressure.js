const RandomMachine = require('./randomMachine');

const bloodPressureGen = (sys, dias) => {
  const newSys = RandomMachine(sys, 5, 2);
  const newDias = RandomMachine(dias, 3, 1);
  const perfect = 2;
  let level;

  if (newSys > 190 || newDias > 100) level = 5;
  else if (newSys > 140 || newDias > 90) level = 4;
  else if (newSys > 120 || newDias > 80) level = 3;
  else if (newSys > 90 || newDias > 60) level = 2;
  else if (newSys > 70 || newDias > 40) level = 1;
  else level = 0;

  return {
    systolic: newSys,
    diastolic: newDias,
    level: level - perfect,
  };
};

module.exports = bloodPressureGen;
