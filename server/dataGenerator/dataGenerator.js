const PatientModel = require('../models/PatientModel');
const redis = require('redis');
const RandomMachine = require('./randomMachine');
const { promisify } = require('util');
const sensors = require('./sensors');

const client = redis.createClient();

const lpushAsync = promisify(client.lpush).bind(client);
const ltrimAsync = promisify(client.ltrim).bind(client);
const lrangeAsync = promisify(client.lrange).bind(client);

const generateAndStore = async timeName => {
  const patients = await PatientModel.find().select('id');
  let data = [];
  patients.map(({ _id }) => {
    let sensorData = [];
    sensors.map(async ({ name, normal, limit, threshold }) => {
      const key = `${_id}:${name}:${timeName}`;
      const current = (await lrangeAsync(key, '0', '0'))[0] || normal;
      const newData = RandomMachine(current, limit, threshold);
      await lpushAsync(key, newData);
      await ltrimAsync(key, '0', '100');

      sensorData.push({ name, value: newData });
    });
    data.push({ id: _id, data: sensorData });
  });

  return data;
};

module.exports = generateAndStore;
