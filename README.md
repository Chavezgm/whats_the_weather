# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

 # Whats the weather? API

Welcome to the Sweater Weather API, a project developed by Martin Chavez for Turing School of Software and Design. This API provides endpoints for retrieving weather forecasts, user registration and authentication, and planning road trips. Below you'll find information on how to set up and use this API.

## Learning Goals

The main learning goals of this project are:
- Build a JSON API using Ruby on Rails
- Consume APIs using HTTParty and Faraday
- Authentication 
- Advanced testing techniques, including stubbing external requests

## Getting Started

To clone and set up this application, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the project directory in your terminal.
3. Run `bundle install` to install the required gems.
4. Set up your database by running `rails db:create` and `rails db:migrate`.
5. You'll need to obtain API keys for MapQuest's Geocoding API and a weather service API. These keys should be stored as environment variables.
6. Once your API keys are set up, you can start the Rails server by running `rails s`.

## Endpoints

### 1. Retrieve Weather for a City

**Endpoint:** `GET /api/v0/forecast`

This endpoint retrieves weather forecast data for a specific city.

**Request Example:**

GET /api/v0/forecast?location=cincinnati,oh

**Response Example:**
```json
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "last_updated": "2023-04-07 16:30",
        "temperature": 55.0,
        "feels_like": 52.0,
        "humidity": 70,
        "uvi": 3.5,
        "visibility": 10,
        "condition": "Partly Cloudy",
        "icon": "partly-cloudy"
      },
      "daily_weather": [
        {
          "date": "2023-04-07",
          "sunrise": "07:13 AM",
          "sunset": "08:07 PM",
          "max_temp": 60.0,
          "min_temp": 45.0,
          "condition": "Partly Cloudy",
          "icon": "partly-cloudy"
        },
        ...
      ],
      "hourly_weather": [
        {
          "time": "14:00",
          "temperature": 54.5,
          "condition": "Partly Cloudy",
          "icon": "partly-cloudy"
        },
        ...
      ]
    }
  }
}

### 2. User Registration

**Endpoint:** `POST /api/v0/users`

This endpoint allows users to register with the application.

**Description:**

This endpoint creates a new user with the provided email and password.

**Request Example:**

```json
POST /api/v0/users
{
  "email": "user@example.com",
  "password": "password",
  "password_confirmation": "password"
}
Response Example:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "user@example.com",
      "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
    }
  }
}

### 3. Login

**Endpoint:** `POST /api/v0/sessions`

This endpoint allows users to log in to the application.

**Description:**

This endpoint authenticates a user by verifying the provided email and password.

**Request Example:**

```json
POST /api/v0/sessions
{
  "email": "user@example.com",
  "password": "password"
}

Response Example:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "user@example.com",
      "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
    }
  }
}

4. Road Trip Planning
Endpoint: POST /api/v0/road_trip

This endpoint allows users to plan road trips between two cities.

Request Example:

POST /api/v0/road_trip
{
  "origin": "Cincinnati, OH",
  "destination": "Chicago, IL",
  "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
}

Response Example:

{
  "data": {
    "id": null,
    "type": "road_trip",
    "attributes": {
      "start_city": "Cincinnati, OH",
      "end_city": "Chicago, IL",
      "travel_time": "04:40:45",
      "weather_at_eta": {
        "datetime": "2023-04-07 23:00",
        "temperature": 44.2,
        "condition": "Cloudy with a chance of meatballs"
      }
    }
  }
}




