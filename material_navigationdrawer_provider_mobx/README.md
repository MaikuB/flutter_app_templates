# Template: material design application with navigation drawer, provider and MobX

This is a template for creating a Flutter application that uses material design and has a navigation drawer. Uses [provider](https://github.com/rrousselGit/provider) and [MobX](https://github.com/mobxjs/mobx.dart) to manage state.

## Overview

The application is similar to the one created when creating an Android application that has a navigation drawer. It has three destinations: Home, Gallery and Slideshow.

Each destination has its own corresponding page and data store. Tapping on the floating action button will increment the counter related to the page that is currently being viewed.

The application is structured as follows

- `lib`
  - `constants` - this folder is where all application-level constants are kept
    - `enums.dart` - to maintain all the application-level enums. For this application, a `Destination` enum is defined that represents all of the destinations: `Home`, `Gallery` and `Slideshow`
    - `keys.dart` - to maintain the keys associated with the various widgets in the application
  - `pages` - has the pages associated with the destinations. Each page has a different title will maintain a separate counter to help demonstrate that each page has its own state
  - `stores` - has all of the stores associated with each page/destination. There is a separate `DestinationsStore` defined in the `destinations_store.dart` file that maintains the selected destination
  - `main.dart` - the entry point for the application and contains the top-level widgets for the application itself
- `test` - 
  - `stores` - this folder has unit tests for all of the stores
  - `widgets` - this folder stores all of the widget tests
    - `pages` - this folder that has files represent widget tests that are tied to pages
    - `app_test.dart` - for doing tests on widgets that are at the top-level e.g. checking bottom navigation bar exists and works
- `test_driver` - this folder stores all of the integration tests. Makes use of the `flutter_driver` library

## Executing unit tests and widget tests

To execute unit tests, run the following command from the root folder of the application

```
flutter test test/**/*.dart
```

## Executing integration tests

To execute integration tests, run the following command from the root folder of the application

```
flutter drive --target=test_driver/app.dart
```
