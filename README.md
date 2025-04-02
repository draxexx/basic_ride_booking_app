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

## Demo Video

[Watch on YouTube](https://youtube.com/shorts/-13WsdxMu9g?feature=share)


## Screenshots

### Select Pickup Location
<img src="https://i.ibb.co/YFjTzGN8/Simulator-Screenshot-i-Phone-16-2025-04-02-at-03-08-28.png" alt="Select Pickup Location" width="300"/>

### Select Destination
<img src="https://i.ibb.co/PZB2t16T/Simulator-Screenshot-i-Phone-16-2025-04-02-at-03-08-52.png" alt="Select Destination" width="300"/>

### Choose the Number of Passengers
<img src="https://i.ibb.co/TBS1b6Vf/Simulator-Screenshot-i-Phone-16-2025-04-02-at-03-09-02.png" alt="Choose the Number of Passengers" width="300"/>

### Select Travel Date and Time  
<img src="https://i.ibb.co/7x7zybQH/Simulator-Screenshot-i-Phone-16-2025-04-02-at-03-09-22.png" alt="Select Travel Date and Time" width="300"/>
<img src="https://i.ibb.co/DfHbSqhC/Simulator-Screenshot-i-Phone-16-2025-04-02-at-03-15-49.png" alt="Select Travel Date and Time" width="300"/>
<img src="https://i.ibb.co/JRZ3GdQY/Simulator-Screenshot-i-Phone-16-2025-04-02-at-03-15-54.png" alt="Select Travel Date and Time" width="300"/>

### Confirm and Book the Ride
<img src="https://i.ibb.co/wF3gwPRm/Simulator-Screenshot-i-Phone-16-2025-04-02-at-03-09-27.png" alt="Confirm and Book the Ride" width="300"/>
<img src="https://i.ibb.co/93SNzDL4/Simulator-Screenshot-i-Phone-16-2025-04-02-at-03-09-32.png" alt="Confirm and Book the Ride" width="300"/>