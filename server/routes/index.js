('use strict');

// Importing the app error class
const AppError = require('../utils/appError');

// Importing the routers
const adminRouter = require('./adminRoutes');
const patientRouter = require('./patientRoutes');
const wardRouter = require('./wardRoutes');

// Importing express router
const router = require('express').Router();

// Registering all routers
// router.use('/users', userRouter);
// router.use('/chambers', chamberRouter);
// router.use('/appointments', appointmentRouter);
router.use('/admin', adminRouter);
router.use('/wards', wardRouter);
router.use('/patients', patientRouter);

// The 404 route
router.all('*', (req, res, next) => next(new AppError('Not found', 404)));

module.exports = router;
