'use strict';

// Importing modules
const { promisify } = require('util');
const jwt = require('jsonwebtoken');
const UserModel = require('../models/UserModel');

const socketProtect = async (socket, next) => {
  console.log('Hit');
  try {
    // Get the cookie
    let token;
    if (
      socket.handshake.headers['authorization'] &&
      socket.handshake.headers['authorization'].startsWith('Bearer')
    ) {
      token = socket.handshake.headers['authorization'].split(' ')[1];
    }
    if (!token) throw 'No Token';

    // Verify the token
    const decoded = await promisify(jwt.verify)(token, process.env.JWT_SECRET);

    // Check if the user available
    const user = await UserModel.findById(decoded.id);
    if (!user) throw 'No user';

    // Check if the user changed password after the password is changed
    if (user.changedPasswordAfter(decoded.iat)) throw 'Password changed';

    if (
      user.role != 'ward-monitor' &&
      user.role != 'nurse' &&
      user.role != 'doctor'
    )
      throw 'No permission';

    // Grant access
    socket.user = user;
    next();
  } catch (error) {
    // If error disconnect the socket
    socket.emit('AuthError', error);
    socket.disconnect();
  }
};

module.exports = socketProtect;
