# Flutter application templates

This repository is to used to maintain some templates that can form the basis of a Flutter application. The intent is that these templates could help other developers get started sooner in the absence of being able specify templates to use to the `flutter create` command.

## Templates 
Templates can be found in the following folders

- `material_bottomnavigation_provider_mobx` - a template for a material design application with bottom navigation, provider and MobX

## Getting started with a template

When creating a brand new Flutter application, there are few steps that developers may do

- specify the organisation 
- specify the name of the app
- specify the languages used for the Android and iOS projects

Note that out of the box, Flutter will combine the organisation and name of the app to set that as the bundle identifier of your Android and iOS application. It is still possible to do all of the above with a template. The following steps are required
1. Clone this repository
2. Pick the folder/template you'd like to use and copy it to the location of your choice. Let's assume for this example that you have picked the `material_bottomnavigation_provider_mobx` folder and copied it to sit within `projects` folder
3. Go to the `projects` folder (i.e. where you've copied the template to). Rename the folder to match the name of your application e.g. `counter`. This is crucial as Flutter's tooling actually uses this as portion of the bundle identifier that represents your application's name
4. Open the `counter` application in your IDE of choice, search for all instances of `material_bottomnavigation_provider_mobx` and replace it with `counter` (the name of your application)
5. From the root folder of your `counter` application. Run the following command

```
flutter create --org <organisation> -a <android_language> -i <ios_language> .
```

where `organisation>` is your organisation in reverse domain name notation. For example, given the `crossingthestreams.io` domain, the organisation would be specified as `io.crossingthestreams`. <android_language> is either `java` or `kotlin` and <ios_language> is either `objc` or `swift`. The tooling will generate a `widget_test.dart` file within the `test` folder that can be deleted. Successfully executing all of the steps would create an application with the desired application name, bundle identifier and create the appropriate Android and iOS project files. From there you should be able to run the application. You can then the `pubspec.yaml` to your liking (e.g. to update the dependencies) 
