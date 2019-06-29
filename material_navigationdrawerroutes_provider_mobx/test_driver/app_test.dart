// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App', () {
    FlutterDriver driver;
    // Note: the approach for finding the drawer menu button and back button is more of a workaround. See https://github.com/flutter/flutter/issues/9002
    final drawerMenuButtonFinder = find.byTooltip('Open navigation menu');
    final backButtonFinder = find.byTooltip('Back');
    final incrementButtonFinder = find.byValueKey('incrementButton');
    final homePageTitleFinder = find.byValueKey('homePageTitle');
    final homePageCounterFinder = find.byValueKey('homePageCounter');
    final galleryPageCounterFinder = find.byValueKey('galleryPageCounter');
    final slideshowPageCounterFinder = find.byValueKey('slideshowPageCounter');
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver?.close();
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print('flutter driver status: ${health.status}');
    });

    test('starts on home page', () async {
      await driver.waitFor(find.byValueKey('homePage'));
    });

    test('switching pages works', () async {
      await _switchToGalleryPage(driver, drawerMenuButtonFinder);
      await _goBackToHomePage(driver, backButtonFinder, homePageTitleFinder);
      await _switchToSlideshowPage(driver, drawerMenuButtonFinder);
      await _goBackToHomePage(driver, backButtonFinder, homePageTitleFinder);
    });

    test('increment counter on home page', () async {
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 1 time(s)');
    });

    test('increment counter on gallery page', () async {
      await _switchToGalleryPage(driver, drawerMenuButtonFinder);
      expect(await driver.getText(galleryPageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(galleryPageCounterFinder),
          'You have pushed the button on this page 2 time(s)');
    });

    test('increment counter on slideshow page', () async {
      await _goBackToHomePage(driver, backButtonFinder, homePageTitleFinder);
      await _switchToSlideshowPage(driver, drawerMenuButtonFinder);
      expect(await driver.getText(slideshowPageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(slideshowPageCounterFinder),
          'You have pushed the button on this page 3 time(s)');
      await _goBackToHomePage(driver, backButtonFinder, homePageTitleFinder);
    });

    test('the last value of the counters on each page are as expected',
        () async {
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 1 time(s)');
      await _switchToGalleryPage(driver, drawerMenuButtonFinder);
      expect(await driver.getText(galleryPageCounterFinder),
          'You have pushed the button on this page 2 time(s)');
      await _goBackToHomePage(driver, backButtonFinder, homePageTitleFinder);
      await _switchToSlideshowPage(driver, drawerMenuButtonFinder);
      expect(await driver.getText(slideshowPageCounterFinder),
          'You have pushed the button on this page 3 time(s)');
    });
  });
}

Future _goBackToHomePage(
    FlutterDriver driver,
    SerializableFinder backButtonFinder,
    SerializableFinder homePageTitleFinder) async {
  await driver.tap(backButtonFinder);
  await driver.waitFor(homePageTitleFinder);
}

Future _switchToSlideshowPage(
    FlutterDriver driver, SerializableFinder drawerIconFinder) async {
  await driver.tap(drawerIconFinder);
  await driver.tap(find.byValueKey('slideshowDrawerItem'));
  await driver.waitFor(find.byValueKey('slideshowPageTitle'));
}

Future _switchToGalleryPage(
    FlutterDriver driver, SerializableFinder drawerIconFinder) async {
  await driver.tap(drawerIconFinder);
  await driver.tap(find.byValueKey('galleryDrawerItem'));
  await driver.waitFor(find.byValueKey('galleryPageTitle'));
}
