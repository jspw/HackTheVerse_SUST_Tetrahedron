# Medone Server

- [Start Server](#start-server)
- [API Documentation](#api-documentation)
  - [Authorization](#authorization)
    - [Registration](#registration)
    - [Login](#login)
    - [Access A Protected or Restricted Route](#access-a-protected-or-restricted-route)
  - [Admin](#admin)
    - [Create User](#create-user)
  - [Wards from Admin Hospital](#wards-from-admin-hospital)
    - [Get Wards](#get-wards)
    - [Create Ward](#create-ward)
    - [Get Single Ward](#get-single-ward)
    - [Update Ward](#update-ward)
  - [Patients from Ward](#patients-from-ward)
    - [Get Patients](#get-patients)
    - [Admit Patient](#admit-patient)
    - [Get Single Patient](#get-single-patient)

## Start Server

At first you have to create a `.env` file, and add your `MONGO_URI` in it. Have a look at the `.env.example` for more information.

Then run `npm i` to install the required packages. Then run `npm run dev` to start the development server (Nodemon is required). Or run `npm start` to start the production server.

## API Documentation

> `*` means it is required

### Authorization

#### Registration

Request: `POST` `/admin/register`

Body:

```json
{
  "admin": {
    "name": "Text*",
    "username": "Text*",
    "email": "Email",
    "phone": "Phone",
    "password": "Text*"
  },
  "hospital": {
    "hospitalName": "Text*",
    "address": "Text*",
    "verificationDataURL": "Text*"
  }
}
```

Response:

```json
{
  "status": "success",
  "jwt": {
    "token": "JWT Token",
    "expiresIn": "Time: ms"
  },
  "data": {
    "user": {
      "_id": "ObjectID",
      "name": "Text",
      "username": "Text",
      "email": "Email",
      "phone": "Text",
      "role": "Text",
      "hospital": "ObjectID",
      "registered_at": "Date"
    },
    "hospital": {
      "verified": "Boolean",
      "_id": "ObjectID",
      "name": "Text",
      "address": "Text"
    }
  }
}
```

#### Login

Request: `POST` `/admin/login`

Body:

```json
{
  "username": "Text*",
  "password": "Text*"
}
```

Response:

```json
{
  "status": "success",
  "jwt": {
    "token": "JWT Token",
    "expiresIn": "Time: ms"
  },
  "data": {
    "user": {
      "_id": "ObjectID",
      "name": "Text",
      "username": "Text",
      "email": "Email",
      "phone": "Text",
      "role": "Text",
      "hospital": "ObjectID",
      "registered_at": "Date"
    },
    "hospital": {
      "verified": "Boolean",
      "_id": "ObjectID",
      "name": "Text",
      "address": "Text"
    }
  }
}
```

#### Access A Protected or Restricted Route

Add the JSON Web Token, you get by logging in or during regestration, on the header like this.

Header:

```json
{
  "authorization": "Bearer JWT_TOKEN"
}
```

If the endpoint is restricted, it'd return a success response, only if the request comes from any allowed user.

### Admin

#### Create User

Request: `RESTRICTED (admin)` `POST` `/admin/createuser`

Body:

```json
{
  "name": "Text*",
  "username": "Text*",
  "email": "Email",
  "password": "Text*",
  "phone": "Text",
  "role": "Text* -> admin/doctor/nurse/ward-monitor",
  "ward": "ObjectID* -> Ward"
}
```

Response:

```json
{
  "status": "success",
  "data": {
    "user": {
      "_id": "ObjectID",
      "name": "Text",
      "username": "Text",
      "email": "Email",
      "phone": "Text",
      "role": "Text",
      "hospital": "ObjectID",
      "registered_at": "Date"
    }
  }
}
```

### Wards from Admin Hospital

#### Get Wards

Request: `RESTRICTED (admin)` `GET` `/wards`

Response:

```json
{
  "status": "success",
  "data": {
    "wards": [
      {
        "_id": "ObjectID",
        "name": "Text",
        "bedCount": "Number",
        "hospital": "ObjectID"
      }
    ]
  }
}
```

#### Create Ward

Request: `RESTRICTED (admin)` `POST` `/wards`

Body:

```json
{
  "name": "Text*",
  "bedCount": "Number*"
}
```

Response:

```json
{
  "status": "success",
  "data": {
    "ward": {
      "_id": "ObjectID",
      "name": "Text",
      "bedCount": "Number",
      "hospital": "ObjectID"
    }
  }
}
```

#### Get Single Ward

Request: `RESTRICTED (admin)` `GET` `/wards/:id`

Response:

```json
{
  "status": "success",
  "data": {
    "wards": {
      "_id": "ObjectID",
      "name": "Text",
      "bedCount": "Number",
      "hospital": "ObjectID"
    }
  }
}
```

#### Update Ward

Request: `RESTRICTED (admin)` `PUT` `/wards/:id`

Body:

```json
{
  "name": "Text*",
  "bedCount": "Number*"
}
```

Response:

```json
{
  "status": "success",
  "data": {
    "ward": {
      "_id": "ObjectID",
      "name": "Text",
      "bedCount": "Number",
      "hospital": "ObjectID"
    }
  }
}
```

### Patients from Ward

#### Get Patients

Request: `RESTRICTED (doctor, nurse, ward-monitor)` `GET` `/patients`

Response:

```json
{
  "status": "success",
  "data": {
    "patients": [
      {
        "admitDate": "Date",
        "releaseDate": "Date",
        "_id": "ObjectID",
        "name": "Text",
        "age": "Number",
        "disease": "Text",
        "hospital": "ObjectID",
        "ward": "ObjectID",
        "bed": "Text",
        "medics": [{ "name": "Text", "frequency": ["Number"], "note": "Text" }]
      }
    ]
  }
}
```

#### Admit Patient

Request: `RESTRICTED (ward-monitor)` `POST` `/patients`

Body:

```json
{
  "name": "Text*",
  "age": "Number*",
  "disease": "Text*",
  "bed": "Text*",
  "note": "Text"
}
```

Response:

```json
{
  "status": "success",
  "data": {
    "patients": {
      "admitDate": "Date",
      "releaseDate": "Date",
      "_id": "ObjectID",
      "name": "Text",
      "age": "Number",
      "disease": "Text",
      "hospital": "ObjectID",
      "ward": "ObjectID",
      "bed": "Text",
      "medics": [{ "name": "Text", "frequency": ["Number"], "note": "Text" }]
    }
  }
}
```

#### Get Single Patient

Request: `RESTRICTED (doctor, nurse, ward-monitor)` `GET` `/patients/:id`

Response:

```json
{
  "status": "success",
  "data": {
    "patients": {
      "admitDate": "Date",
      "releaseDate": "Date",
      "_id": "ObjectID",
      "name": "Text",
      "age": "Number",
      "disease": "Text",
      "hospital": "ObjectID",
      "ward": "ObjectID",
      "bed": "Text",
      "medics": [{ "name": "Text", "frequency": ["Number"], "note": "Text" }]
    }
  }
}
```

### Users from Hospital or Ward

#### Get All Ward Monitors

Request: `RESTRICTED (admin)` `GET` `/users/ward-monitors`

Response:

```json
{
  "status": "success",
  "data": {
    "wardMonitors": [
      {
        "_id": "ObjectID",
        "name": "Text",
        "username": "Text",
        "email": "Email",
        "phone": "Text",
        "role": "Text",
        "hospital": "ObjectID",
        "ward": "ObjectID",
        "registered_at": "Date"
      }
    ]
  }
}
```

#### Get All Doctors

Request: `RESTRICTED (admin, ward-monitor, doctor, nurse)` `GET` `/users/doctors`

Response:

```json
{
  "status": "success",
  "data": {
    "doctors": [
      {
        "_id": "ObjectID",
        "name": "Text",
        "username": "Text",
        "email": "Email",
        "phone": "Text",
        "role": "Text",
        "hospital": "ObjectID",
        "ward": "ObjectID",
        "registered_at": "Date"
      }
    ]
  }
}
```

#### Get All Nurses

Request: `RESTRICTED (admin, ward-monitor, doctor, nurse)` `GET` `/users/nurses`

Response:

```json
{
  "status": "success",
  "data": {
    "nurses": [
      {
        "_id": "ObjectID",
        "name": "Text",
        "username": "Text",
        "email": "Email",
        "phone": "Text",
        "role": "Text",
        "hospital": "ObjectID",
        "ward": "ObjectID",
        "registered_at": "Date"
      }
    ]
  }
}
```
