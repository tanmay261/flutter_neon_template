# Neon Open Source Flutter Starter Kit

We are thrilled to present the Neon Open Source Starter Kit, crafted as part of the Neon Open Source Starter Kit Challenge. This starter kit is designed to offer a comprehensive, scalable foundation for building Flutter applications, optimized for PostgreSQL on Neon.

## Overview

### Introduction
The Neon Open Source Starter Kit provides a robust foundation to accelerate the development of Flutter applications. It includes essential features, best practices, and a structured approach to ensure scalability and maintainability.

### Features
- **Organized Project Structure:** Well-structured folder organization with clear separation of concerns.
- **State Management:** Preconfigured state management solution with an example implementation.
- **Custom Themes:** Predefined light and dark themes with easy switching.
- **Routing:** Structured routing with `go_router`, including named routes and deep linking.
- **Localization:** Internationalization support with `flutter_localizations` and `intl`.
- **Networking:** Preconfigured API client with `Dio` and example service for RESTful API calls.
- **Error Handling:** Centralized error handling with custom error messages and snackbars.
- **Authentication:** Example implementation for secure authentication flows.
- **Testing:** Comprehensive setup for unit, widget, and integration tests.
- **CI/CD:** Basic CI/CD pipeline configuration with automated testing and deployment.
- **Code Quality:** Preconfigured linting and formatting with custom rules.
- **App Icon and Splash Screen:** Customizable icons and splash screens setup.
- **Package Management:** Predefined common packages with example usage.
- **Documentation:** Detailed documentation with setup instructions and best practices.
- **Performance Optimization:** Tips and tools for performance profiling.
- **Analytics and Crash Reporting:** Setup for Firebase Analytics and Crashlytics.
- **Environment Configuration:** Management for different environments using `flutter_dotenv`.

### Technologies Used
- [**Flutter:**](https://flutter.dev/) Framework for building natively compiled applications for mobile, web, and desktop.
- [**Neon:**](https://neon.tech/) Cloud-based PostgreSQL database.
- [**Firebase:**](https://firebase.google.com/) For analytics, and crash reporting.
- [**Bloc:**](https://bloclibrary.dev/) State management solutions.

## Getting Started

### Prerequisites
- [**Flutter SDK:**](https://docs.flutter.dev/get-started/install) Ensure Flutter is installed on your machine.
- [**Postgres on Neon :**](https://neon.tech/) Access to Neon for PostgreSQL database.

### Installation
1. Clone the repository:
   
   ```bash
   git clone https://github.com/tanmay261/flutter_neon_template.git
   ```
3. Navigate to the project directory:
   
   ```bash
    cd flutter_neon_template
   ```
4. Install dependencies:
   
    ```bash
    flutter pub get
    ```
**Note:** Feel Free to do a ```search and replace(Ctrl+Shift+H or ⇧⌘H)``` to give desired name to your app

### Configuration

1. Create a .env file in the root directory and add the following configuration:
   
   ```
    NEON_HOST=
    NEON_DATABASE=
    NEON_USERNAME=
    NEON_PASSWORD=
   ```


## Usage

### How to use the app

```bash
flutter run
```


## Codebase Overview

### Directory Structure

```
flutter_neon_template/
├── .gitignore
├── .env
├── pubspec.yaml
├── pubspec.lock
├── README.md
├── android/
├── ios/
├── assets/
│   ├── images/
├── lib/
│   ├── models/              # Data models
│   ├── bloc/                # Files for Bloc state management
│   ├── repository/          # Interactions with the database
│   ├── services/            # Business logic and use cases
│   ├── screens/             # UI screens
│   ├── widgets/             # Reusable widgets/components
│   ├── provider/            # Provider configuration
│   ├── utils/               # Utility classes and functions
│   ├── theme/               # Theme configuration
│   ├── routes.dart          # Route management
│   ├── constants.dart       # Application constants
│   └── main.dart            # Entry point of the application
├── test/                    # Unit, widget, and integration tests
└── .github/
    └── workflows/
        └── build_verification.yml  # GitHub Actions workflow configuration
```





