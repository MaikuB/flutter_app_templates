# Template: material design application with navigation drawer, provider and MobX

This is a template for creating a Flutter application that uses material design and has a navigation drawer. Uses [provider](https://github.com/rrousselGit/provider) and [MobX](https://github.com/mobxjs/mobx.dart) to manage state.

## Overview

The application is similar to the one created when creating an Android application that has a navigation drawer. It has four destinations: Home, Gallery, Slideshow and Settings. The latter allows toggling the dark mode theme on and off. This setting is saved using the [shared_preferences](https://github.com/flutter/plugins/tree/master/packages/shared_preferences) plugin.

![Image of navigation drawer](https://crossingthestreams.io/content/images/2019/06/image-4.png) ![Image of home page](https://crossingthestreams.io/content/images/2019/06/home-5.png) ![Image of slideshow page](https://crossingthestreams.io/content/images/2019/06/slideshow-2.png) ![Image of gallery page](https://crossingthestreams.io/content/images/2019/06/gallery-1.png) ![Image of settings page](https://crossingthestreams.io/content/images/2019/06/settings-2.png)

Each destination has its own corresponding page and data store. Tapping on the floating action button will increment the counter related to the page that is currently being viewed. The settings page allows toggling on and off the dark theme. An [alternative template](https://github.com/MaikuB/flutter_app_templates/tree/master/material_navigationdrawerroutes_provider_mobx) that uses routes can be found at repository as well.

The application is structured as follows

- `lib`
  - `constants` - this folder is where all application-level constants are kept
    - `enums.dart` - to maintain all the application-level enums. For this application, a `Destination` enum is defined that represents all of the destinations: `Home`, `Gallery`, `Slideshow` and `Settings`
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
flutter test
```

## Executing integration tests

To execute integration tests, run the following command from the root folder of the application

```
flutter drive --target=test_driver/app.dart
```
