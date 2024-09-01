# Itemify

Itemify is a simple mobile application built using Flutter that allows users to manage a list of items. Users can add, view, and delete items, making it a practical solution for note-taking, task management, or inventory tracking. The app is designed to work seamlessly on both Android and iOS platforms, although iOS deployment is currently not included.

## Features

- **Add Items**: Users can add new items by providing a title and description.
- **View Items**: The app displays a list of all added items, each showing a title and description.
- **Delete Items**: Users can remove items from the list.
- **Responsive Design**: The app is designed to work well on various screen sizes and devices.
- **State Management**: Uses `async_redux` for efficient state management and scalability.

## Getting Started

To get started with the project, follow these instructions:

1. **Clone the Repository**:

    ```bash
    git clone https://github.com/DanroyMwangi/itemify.git
    cd itemify
    ```

2. **Install Dependencies**:

    ```bash
    flutter pub get
    ```

3. **Run the App**:

    ```bash
    flutter run
    ```

4. **Build the APK**:
    To build a release APK for Android:

    ```bash
    flutter build apk --release
    ```

## Continuous Integration

This project uses GitHub Actions for continuous integration. On every push to the `main` branch or on pull requests, the following actions are triggered:

- **Build APK**: The app is built into a release APK using Flutter.
- **Run Tests**: The test suite is executed to ensure code quality and functionality.
- **Upload Artifacts**: The APK is uploaded as an artifact for download.
