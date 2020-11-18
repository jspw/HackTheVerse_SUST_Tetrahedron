const PatientModel = require('../models/PatientModel');
const redis = require('redis');
const RandomMachine = require('./randomMachine');
const { promisify } = require('util');
const sensors = require('./sensors');

const client = redis.createClient();

const lpushAsync = promisify(client.lpush).bind(client);
const ltrimAsync = promisify(client.ltrim).bind(client);
const lrangeAsync = promisify(client.lrange).bind(client);

const generateAndStore = async (timeName, io) => {
  const patients = await PatientModel.find();
  // io.sockets.emit('emergency', patients);
  // io.to('5faf585633156c488c7243a6').emit('emergency', 'hello');
  patients.map(patient => {
    sensors.map(async ({ name, normal, limit, threshold, min, max }) => {
      const key = `${patient._id}:${name}:${timeName}`;
      const current = (await lrangeAsync(key, '0', '0'))[0] || normal;
      const newData = RandomMachine(current, limit, threshold);
      await lpushAsync(key, newData);
      await ltrimAsync(key, '0', '100');

      if (newData < min)
        io.to(`${patient.ward}`).emit('emergency', {
          name,
          value: newData,
          patient,
          type: 'fall',
          message: `${name} of ${patient.name} from ${patient.bed} has fall down`,
        });

      if (newData > max)
        io.to(`${patient.ward}`).emit('emergency', {
          name,
          value: newData,
          patient,
          type: 'rise',
          message: `${name} of ${patient.name} from ${patient.bed} has increased a lot`,
        });
    });
  });
};

module.exports = generateAndStore;
