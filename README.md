# Gaming and Learning App

This is a Flutter-based application designed to provide an engaging platform for gaming and learning. The app dynamically fetches course content from a backend server and displays it using interactive widgets.

## Features

- **Dynamic Course Content**: Fetch and display course content dynamically from the backend.
- **Interactive Widgets**: Includes widgets for fill-in-the-blanks, image matching, audio-based learning, and sentence completion.
- **Backend Integration**: A Node.js backend server simulates API endpoints for course content.
- **Responsive UI**: Designed to work seamlessly across devices.

---

## Project Structure

### Backend
- **Path**: `backend/`
- **File**: `server.js`
- **Description**: A Node.js server that provides API endpoints for course content.

### Frontend
- **Path**: `gaming_learning_app/`
- **Description**: A Flutter application that fetches and displays course content.

---

## Prerequisites

### Backend
- Node.js (v14 or later)
- npm (Node Package Manager)

### Frontend
- Flutter SDK (v3.0 or later)
- Android Studio or Xcode for running the app on an emulator or physical device.

---

## Setup Instructions

### Backend Setup
1. Navigate to the `backend/` directory:
   ```bash
   cd backend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the server:
   ```bash
   node server.js
   ```
4. The server will run on `http://localhost:5000`.

### Frontend Setup
1. Navigate to the `gaming_learning_app/` directory:
   ```bash
   cd gaming_learning_app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

---

## API Endpoints

### `/api/profile`
- **Method**: GET
- **Description**: Fetches user profile data.

### `/api/course-content`
- **Method**: GET
- **Description**: Fetches course content.

### `/api/createCourseContent`
- **Method**: POST
- **Description**: Creates and fetches course content for a specific class.

---

## Testing

### Widget Tests
1. Navigate to the `gaming_learning_app/` directory:
   ```bash
   cd gaming_learning_app
   ```
2. Run the tests:
   ```bash
   flutter test
   ```

---

## Troubleshooting

### Backend
- Ensure the Node.js server is running on `http://localhost:5000`.
- Check the `server.js` file for any errors.

### Frontend
- Ensure the Flutter SDK is installed and properly configured.
- Verify the backend server is accessible from the app.



