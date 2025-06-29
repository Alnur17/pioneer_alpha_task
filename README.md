# Pioneer Alpha Task

## Project Overview
The **Pioneer Alpha Task** is a Flutter application designed to search GitHub for repositories using the keyword "Flutter" and display the top 50 most-starred repositories. The app supports offline browsing using `GetStorage`, allows sorting by stars or last updated date with toggle sorting order, and provides a detailed view for each repository. The detailed view includes:
- Owner's name
- Profile photo
- Repository description
- Stars count
- Last update date-time (formatted as `MM-DD-YYYY HH:MM`)

Built with the **GetX pattern** for state management and navigation, the app features a clean, responsive design suitable for both mobile and tablet screens. It also supports theme functionality with light and dark modes and includes pull-to-refresh capability.

## How to Run the App

### Prerequisites
- **Flutter SDK**: Version >= 3.5.4
- **Dart**
- **Git**
- An Android/iOS emulator or a physical device

### Setup Instructions
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/Alnur17/pioneer_alpha_task.git
   cd pioneer_alpha_task
2. Install the required dependencies:
   ```bash
   flutter pub get

### Running the Application
1. Ensure a device or emulator is connected and recognized by Flutter.
2. Launch the app:
   ```bash
   flutter run

### Testing
- Verify that the app successfully fetches repositories from the GitHub API.
- Test offline mode functionality using GetStorage.
- Confirm sorting by stars or last updated date works as expected.
- Navigate to the details page and check all displayed information (owner name, photo, description, etc.)

### Dependencies Used
The following packages are utilized in the development of this application:
- get: GetX for state management and navigation
- http: HTTP client for GitHub API requests
- google_fonts: Support for custom fonts
- get_storage: Local storage for offline support
- cached_network_image: Efficient image caching
- intl: Date and time formatting

### App Links
📎 [Drive Link](https://drive.google.com/file/d/1gzVc9_surUf9N6WRBHZTZcgKBaE3-84z/view?usp=sharing)
