# Template: material design application with navigation drawer, routes, provider and MobX

This is a template for creating a Flutter application that uses material design and has a navigation drawer. Selecting a destination other than the home triggers navigating to another. Uses [provider](https://github.com/rrousselGit/provider) and [MobX](https://github.com/mobxjs/mobx.dart) to manage state.

## Overview

The application is similar to the one created when creating an Android application that has a navigation drawer. It has four destinations: Home, Gallery, Slideshow and Settings. The latter allows toggling the dark mode theme on and off. This setting is saved using the [shared_preferences](https://github.com/flutter/plugins/tree/master/packages/shared_preferences) plugin.

Each destination has its own corresponding page and data store. Tapping on the floating action button will increment the counter related to the page that is currently being viewed. Selecting a destination other than the home page will trigger navigating to the selected destination using routes. From there, the user has the option of tapping on the back button to go back to the home page that is configured as the initial route.

The application is structured as follows:

- `lib`
  - `constants` - this folder is where all application-level constants are kept
    - `routes.dart` - to maintain all of the routes that represent the destinations
    - `keys.dart` - to maintain the keys associated with the various widgets in the application
  - `pages` - has the pages associated with the destinations. Each page has a different title will maintain a separate counter to help demonstrate that each page has its own state
  - `services` - has all of the application services used e.g. a service for managing shared preferences
  - `stores` - has all of the data stores associated with each page/destination
  - `main.dart` - the entry point for the application and contains the top-level widgets for the application itself
- `test`
  - `mocks` - for storing mocks that will be used by various tests
  - `stores` - this folder has unit tests for all of the stores
  - `widgets` - this folder contains all of the widget tests
    - `pages` - this folder that has files represent widget tests that are tied to pages
    - `app_test.dart` - for doing tests on widgets that are at the top-level e.g. checking bottom navigation bar exists and works
- `test_driver` - this folder has all of the integration tests. Makes use of the `flutter_driver` library

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
