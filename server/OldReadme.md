# Medone Server

- [Start Server](#start-server)
- [API Documentation](#api-documentation)
  - [Authorization](#authorization)
    - [Registration](#registration)
    - [Login](#login)
    - [Access A Protected/Restricted Route](#access-a-protected-restricted-route)
  - [Users](#users)
    - [Get All Users](#get-all-users)
    - [Get Single User](#get-single-user)
  - [Profile](#profile)
    - [Get User Profile](#get-user-profile)
    - [Update User Profile](#update-user-profile)
  - [Chambers](#chambers)
    - [Create Chamber](#create-chamber)
    - [Get All Chambers](#get-all-chambers)
    - [Get All Chambers From A city](#get-all-chambers-from-a-city)
  - [Appointments](#appointments)
    - [Create Appointment](#create-appointment)
    - [Get All Appointments](#get-all-appointments)
    - [Get My Appointments](#get-my-appointments)
    - [Get Single Appointment](#get-single-appointment)

## Start Server

At first you have to create a `.env` file, and add your `MONGO_URI` in it. Have a look at the `.env.example` for more information.

Then run `npm i` to install the required packages. Then run `npm run dev` to start the development server (Nodemon is required). Or run `npm start` to start the production server.

## API Documentation

### Authorization

#### Registration

Request: `POST` `/users`

Body:

```json
{
  "name": "Text",
  "email": "Email",
  "password": "Text",
  "nid": "Text",
  "phone": "Text",
  "dateOfBirth": "Date",
  "role": ["patient", "doctor", "pharmacy", "super-admin"]
}
```

Response:

```json
{
  "status": "success",
  "jwt": {
    "token": "JWT Token",
    "expiresIn": "Expiration Time: MS"
  },
  "data": {
    "user": {
      "role": "Text",
      "_id": "ObjectID",
      "name": "Text",
      "email": "Email",
      "nid": "Text",
      "phone": "Text",
      "dateOfBirth": "Date",
      "registered_at": "Date"
    }
  }
}
```

#### Login

Request: `POST` `/users/login`

Body:

```json
{
  "email": "Email",
  "password": "Text"
}
```

Response:

```json
{
  "status": "success",
  "jwt": {
    "token": "JWT Token",
    "expiresIn": "Expiration Time: MS"
  },
  "data": {
    "user": {
      "role": "Text",
      "_id": "ObjectID",
      "name": "Text",
      "email": "Email",
      "nid": "Text",
      "phone": "Text",
      "dateOfBirth": "Date",
      "registered_at": "Date"
    }
  }
}
```

#### Access A Protected/Restricted Route

Add the JSON Web Token, you get by logging in or during regestration, on the header like this.

Header:

```json
{
  "authorization": "Bearer JWT_TOKEN"
}
```

### Users

#### Get All Users

Request: `PROTECTED` `GET` `/users`

Response:

```json
{
  "status": "success",
  "data": [
    {
      "user": {
        "role": "Text",
        "_id": "ObjectID",
        "name": "Text",
        "email": "Email",
        "nid": "Text",
        "phone": "Text",
        "dateOfBirth": "Date",
        "registered_at": "Date"
      }
    }
  ]
}
```

#### Get Single User

Request: `PROTECTED` `GET` `/users/:id`

Response:

```json
{
  "status": "success",
  "data": {
    "user": {
      "role": "Text",
      "_id": "ObjectID",
      "name": "Text",
      "email": "Email",
      "nid": "Text",
      "phone": "Text",
      "dateOfBirth": "Date",
      "registered_at": "Date"
    }
  }
}
```

### Profile

#### Get User Profile

Request: `PROTECTED` `GET` `/users/me`

Response:

```json
{
  "status": "success",
  "data": {
    "user": {
      "role": "Text",
      "_id": "ObjectID",
      "name": "Text",
      "email": "Email",
      "nid": "Text",
      "phone": "Text",
      "dateOfBirth": "Date",
      "registered_at": "Date"
    }
  }
}
```

#### Update User Profile

Request: `PROTECTED` `PUT` `/users/me`

Body:

```json
{
  "name": "Text",
  "phone": "Text"
}
```

Response:

```json
{
  "status": "success",
  "data": {
    "user": {
      "role": "Text",
      "_id": "ObjectID",
      "name": "Text",
      "email": "Email",
      "nid": "Text",
      "phone": "Text",
      "dateOfBirth": "Date",
      "registered_at": "Date"
    }
  }
}
```

### Chambers

#### Create Chamber

Request: `RESTRICTED( doctor )` `POST` `/chambers`

Body:

```json
{
  "name": "Text",
  "city": "Text",
  "contact": "Text",
  "weekdays": ["Bool", "Bool", "Bool", "Bool", "Bool", "Bool", "Bool"]
}
```

Response:

```json
{
  "status": "success",
  "data": {
    "chamber": {
      "_id": "ObjectID",
      "weekdays": ["Bool", "Bool", "Bool", "Bool", "Bool", "Bool", "Bool"],
      "name": "Text",
      "city": "Text",
      "contact": "Text",
      "doctor": "ObjectID"
    }
  }
}
```

#### Get All Chambers

Request: `Protected` `GET` `/chambers`

Response:

```json
{
  "status": "success",
  "data": {
    "chambers": [
      {
        "_id": "ObjectID",
        "weekdays": ["Bool", "Bool", "Bool", "Bool", "Bool", "Bool", "Bool"],
        "name": "Text",
        "city": "Text",
        "contact": "Text",
        "doctor": "ObjectID"
      }
    ]
  }
}
```

#### Get All Chambers From A city

Request: `Protected` `GET` `/chambers/city/:city`

Response:

```json
{
  "status": "success",
  "data": {
    "chambers": [
      {
        "_id": "ObjectID",
        "weekdays": ["Bool", "Bool", "Bool", "Bool", "Bool", "Bool", "Bool"],
        "name": "Text",
        "city": "Text",
        "contact": "Text",
        "doctor": "ObjectID"
      }
    ]
  }
}
```

### Appointments

#### Create Appointment

Request: `RESTRICTED( patient )` `POST` `/appointments`

Body:

```json
{
  "disease": "Text",
  "date": "Date (2020-11-14)",
  "doctor": "ObjectID",
  "chamber": "ObjectID",
  "note": "Text"
}
```

Response:

```json
{
  "status": "success",
  "data": {
    "appointment": {
      "_id": "ObjectID",
      "disease": "Text",
      "date": "Date",
      "doctor": "ObjectID",
      "chamber": "ObjectID",
      "note": "Text",
      "patient": "ObjectID"
    }
  }
}
```

#### Get All Appointments

Request: `PROTECTED` `GET` `/appointments`

Response:

```json
{
  "status": "success",
  "data": {
    "appointments": [
      {
        "_id": "ObjectID",
        "disease": "Text",
        "date": "Date",
        "doctor": "ObjectID",
        "chamber": "ObjectID",
        "note": "Text",
        "patient": "ObjectID"
      }
    ]
  }
}
```

#### Get My Appointments

Request: `RESTRICTED (doctor, patient)` `GET` `/appointments/my`

Response:

```json
{
  "status": "success",
  "data": {
    "appointments": [
      {
        "_id": "ObjectID",
        "disease": "Text",
        "date": "Date",
        "doctor": "DoctorModel",
        "chamber": "ChamberModel",
        "note": "Text",
        "patient": "PatientModel"
      }
    ]
  }
}
```

#### Get Single Appointment

Request: `PROTECTED` `GET` `/appointments/:id`

Response:

```json
{
  "status": "success",
  "data": {
    "appointment": {
      "_id": "ObjectID",
      "disease": "Text",
      "date": "Date",
      "doctor": "DoctorModel",
      "chamber": "ChamberModel",
      "note": "Text",
      "patient": "PatientModel"
    }
  }
}
```
