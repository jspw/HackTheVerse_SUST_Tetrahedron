const PatientModel = require('../models/PatientModel');
const redis = require('redis');
const RandomMachine = require('./randomMachine');
const { promisify } = require('util');

const client = redis.createClient();

const lpushAsync = promisify(client.lpush).bind(client);
const ltrimAsync = promisify(client.ltrim).bind(client);
const lrangeAsync = promisify(client.lrange).bind(client);

const sensors = [
  {
    name: 'temperature',
    normal: 98,
    limit: 2,
    threshold: 1,
  },
  {
    name: 'pulse',
    normal: 80,
    limit: 3,
    threshold: 2,
  },
  {
    name: 'sys',
    normal: 110,
    limit: 5,
    threshold: 2,
  },
  {
    name: 'dias',
    normal: 80,
    limit: 3,
    threshold: 1,
  },
  {
    name: 'oxygen',
    normal: 95,
    limit: 2,
    threshold: 1,
  },
];

const generateAndStore = async timeName => {
  const patients = await PatientModel.find().select('id');
  patients.map(({ _id }) => {
    sensors.map(async ({ name, normal, limit, threshold }) => {
      const key = `${_id}:${name}:${timeName}`;
      const current = (await lrangeAsync(key, '0', '0'))[0] || normal;
      const newData = RandomMachine(current, limit, threshold);
      await lpushAsync(key, newData);
      await ltrimAsync(key, '0', '100');
    });
  });
};

module.exports = generateAndStore;
