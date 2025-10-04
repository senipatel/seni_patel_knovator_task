# Flutter Post Countdown App

This is a Flutter application that fetches a list of posts from a public API and displays them in a list. Each post has a 60-second countdown timer. When a post is tapped, it is marked as "read" and navigation to a detail screen occurs.

## Features

- Fetches posts from the JSONPlaceholder API.
- [Dummy API](https://jsonplaceholder.typicode.com/posts)
- Displays a list of posts with titles and countdown timers.
- Each post has a Random-second countdown timer(etc 10,15,20,25).
- Tapping a post marks it as "read" and navigates to a detail screen.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- An editor like [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with the Flutter plugin.

### Installation

1. Clone the repository:
   ```bash
   git clone <your-repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd seni_patel_knovator_task
   ```
3. Install the dependencies:
   ```bash
   flutter pub get
   ```

### Running the Application

You can run the application on an emulator or a physical device using the following command:
```bash
flutter run
```

## Project Structure

- `lib/main.dart`: The entry point of the application.
- `lib/screens/homepage.dart`: The main screen that displays the list of posts and manages the countdown timers.
- `lib/screens/nextpage.dart`: The detail screen that is displayed when a post is tapped.
- `lib/model/post.dart`: The data model for a post.
- `pubspec.yaml`: The project's configuration file, including dependencies.
