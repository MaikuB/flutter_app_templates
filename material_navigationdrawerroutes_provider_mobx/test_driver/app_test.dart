// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App', () {
    FlutterDriver driver;
    // Note: the approach for finding the drawer menu button and back button is more of a workaround. See https://github.com/flutter/flutter/issues/9002
    final drawerMenuButtonFinder = find.byTooltip('Open navigation menu');
    final backButtonFinder = find.byTooltip('Back');
    final galleryDrawerItemFinder = find.byValueKey('galleryDrawerItem');
    final galleryPageFinder = find.byValueKey('galleryPage');
    final settingsDrawerItemFinder = find.byValueKey('settingsDrawerItem');
    final settingsPageFinder = find.byValueKey('settingsPage');
    final slideshowDrawerItemFinder = find.byValueKey('slideshowDrawerItem');
    final slideshowPageFinder = find.byValueKey('slideshowPage');
    final incrementButtonFinder = find.byValueKey('incrementButton');
    final homePageFinder = find.byValueKey('homePage');
    final homePageCounterFinder = find.byValueKey('homePageCounter');
    final galleryPageCounterFinder = find.byValueKey('galleryPageCounter');
    final slideshowPageCounterFinder = find.byValueKey('slideshowPageCounter');
    final useDarkModeSettingFinder = find.byValueKey('useDarkModeSetting');
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver?.close();
    });

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      print('flutter driver status: ${health.status}');
    });

    test('starts on home page', () async {
      await driver.waitFor(find.byValueKey('homePage'));
    });

    test('select pages works', () async {
      await _selectPage(driver, drawerMenuButtonFinder, galleryDrawerItemFinder,
          galleryPageFinder);
      await _goBackToHomePage(driver, backButtonFinder, homePageFinder);
      await _selectPage(driver, drawerMenuButtonFinder,
          slideshowDrawerItemFinder, slideshowPageFinder);
      await _goBackToHomePage(driver, backButtonFinder, homePageFinder);
      await _selectPage(driver, drawerMenuButtonFinder,
          settingsDrawerItemFinder, settingsPageFinder);
      await _goBackToHomePage(driver, backButtonFinder, homePageFinder);
    });

    test('increment counter on home page', () async {
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 1 time(s)');
    });

    test('increment counter on gallery page', () async {
      await _selectPage(driver, drawerMenuButtonFinder, galleryDrawerItemFinder,
          galleryPageFinder);
      expect(await driver.getText(galleryPageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(galleryPageCounterFinder),
          'You have pushed the button on this page 2 time(s)');
    });

    test('increment counter on slideshow page', () async {
      await _goBackToHomePage(driver, backButtonFinder, homePageFinder);
      await _selectPage(driver, drawerMenuButtonFinder,
          slideshowDrawerItemFinder, slideshowPageFinder);
      expect(await driver.getText(slideshowPageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(slideshowPageCounterFinder),
          'You have pushed the button on this page 3 time(s)');
    });

    test('toggle dark mode', () async {
      await _goBackToHomePage(driver, backButtonFinder, homePageFinder);
      await _selectPage(driver, drawerMenuButtonFinder,
          settingsDrawerItemFinder, settingsPageFinder);
      await driver.tap(useDarkModeSettingFinder);
    });

    test('the last value of the counters on each page are as expected',
        () async {
      await _goBackToHomePage(driver, backButtonFinder, homePageFinder);
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 1 time(s)');
      await _selectPage(driver, drawerMenuButtonFinder, galleryDrawerItemFinder,
          galleryPageFinder);
      expect(await driver.getText(galleryPageCounterFinder),
          'You have pushed the button on this page 2 time(s)');
      await _goBackToHomePage(driver, backButtonFinder, homePageFinder);
      await _selectPage(driver, drawerMenuButtonFinder,
          slideshowDrawerItemFinder, slideshowPageFinder);
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

Future _selectPage(
    FlutterDriver driver,
    SerializableFinder drawerMenuButtonFinder,
    SerializableFinder drawerItemFinder,
    SerializableFinder pageFinder) async {
  await driver.tap(drawerMenuButtonFinder);
  await driver.tap(drawerItemFinder);
  await driver.waitFor(pageFinder);
}
