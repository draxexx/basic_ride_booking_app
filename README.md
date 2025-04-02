# Basic Ride Booking App
This project allows a user to plan a trip by simply selecting the starting and destination points on a map. While planning the trip, the user can also specify the number of passengers and choose the travel date.

## Project Structure

```
lib/
├── models/         # Data models and entities
├── providers/      # State management using Provider
├── screens/        # UI screens and pages
├── services/       # Business logic and services
├── utils/          # Common utilities, constants, and helpers
├── widgets/        # Reusable UI components
```

## Technologies Used

- **Flutter**: 3.29.2  
- **Dart**: 3.7.2

## Setup Instructions

To run the project without issues, make sure to create a `.env` file in the root directory and add your **Google API Key** as shown below:

```
GOOGLE_API_KEY=your_api_key_here
```

> ⚠️ This key is required for using Google Maps and related services such as Directions API.

## Key Features

• Select pickup and destination locations using Google Maps API  
• Automatically draw a route between the selected points  
• Choose the number of passengers   
• Select travel date and time  
• Confirm and book the ride