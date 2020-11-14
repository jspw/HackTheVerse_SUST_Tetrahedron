'use strict';

// Importing packages
const generateAndStore = require('./dataGenerator/dataGenerator');
const mongoose = require('mongoose');
const socketProtect = require('./middlewares/socketProtect');

// Confuguring the environment variables
require('dotenv').config();
const PORT = process.env.PORT || 8000;
const HOST = process.env.HOST || 'localhost';

// Database Connection
const db = process.env.MONGO_URI;
let connected = false;
mongoose
  .connect(db, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true,
  })
  .then(() => {
    console.log('Connected to database');
    connected = true;
  });

// Calling the random data generator
setInterval(() => {
  if (connected) generateAndStore('second');
}, 1000);

setInterval(() => {
  if (connected) generateAndStore('minute');
}, 60000);

// Importing the express app
const app = require('./app');
const http = require('http').createServer(app);
const io = require('socket.io')(http);

io.use(socketProtect);

io.on('connection', socket => {
  console.log('a user connected');

  console.log(socket.user);

  socket.on('disconnect', () => {
    console.log('Got disconnect!');
  });

  socket.on('logout', () => {
    socket.disconnect();
  });
});

// Starting the server
const server = http.listen(PORT, HOST, () => {
  console.log(`Server started on ${HOST}:${PORT}`);
});

// Handle Unhandled Rejections
process.on('unhandledRejection', err => {
  console.log('Unhandled Rejection! Shutting down the server...');
  console.error(err);
  server.close(() => {
    process.exit(1);
  });
});
