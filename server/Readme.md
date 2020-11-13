# Medone Server

- [Start Server](#start-server)
- [API Documentation](#api-documentation)
  - [Authorization](#authorization)
    - [Registration](#registration)

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
      "registered_at": "Date",
      "__v": 0
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
