const sensors = [
  {
    name: 'temperature',
    normal: 98,
    limit: 0.2,
    threshold: 5,
    min: 92,
    max: 106,
  },
  {
    name: 'pulse',
    normal: 80,
    limit: 0.5,
    threshold: 3,
    min: 40,
    max: 140,
  },
  {
    name: 'systolic',
    normal: 110,
    limit: 1,
    threshold: 3,
    min: 70,
    max: 150,
  },
  {
    name: 'diastolic',
    normal: 80,
    limit: 0.5,
    threshold: 3,
    min: 50,
    max: 100,
  },
  {
    name: 'oxygen',
    normal: 95,
    limit: 0.1,
    threshold: 3,
    min: 90,
    max: 100,
  },
];

module.exports = sensors;
