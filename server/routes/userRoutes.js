'use strict';

// Importing functions from the controller
const {
  getUser,
  signUp,
  getSingleUser,
  login,
  logout,
  getMyProfile,
  updateProfile,
} = require('../controllers/userController');
const { protect } = require('../middlewares/protect');

// Importing the express router
const userRouter = require('express').Router();

// Setting up the routes
userRouter.route('/').get(protect, getUser).post(signUp);
userRouter.route('/me').get(protect, getMyProfile).put(protect, updateProfile);
userRouter.route('/login').post(login);
userRouter.route('/logout').get(protect, logout);
userRouter.route('/:id').get(protect, getSingleUser);

module.exports = userRouter;
