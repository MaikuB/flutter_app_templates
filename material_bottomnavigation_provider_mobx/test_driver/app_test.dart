// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App', () {
    FlutterDriver driver;
    final bottomNavigationBarFinder = find.byValueKey('bottomNavigationBar');
    final incrementButtonFinder = find.byValueKey('incrementButton');
    final homePageFinder = find.byValueKey('homePage');
    final dashboardPageFinder = find.byValueKey('dashboardPage');
    final notificationsPageFinder = find.byValueKey('notificationsPage');
    final settingsPageFinder = find.byValueKey('settingsPage');
    final homePageCounterFinder = find.byValueKey('homePageCounter');
    final dashboardPageCounterFinder = find.byValueKey('dashboardPageCounter');
    final notificationsPageCounterFinder =
        find.byValueKey('notificationsPageCounter');
    final useDarkModeSettingFinder = find.byValueKey('useDarkModeSetting');

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

    test('selecting pages works', () async {
      await _selectPage(
          driver, bottomNavigationBarFinder, 'Dashboard', dashboardPageFinder);
      await _selectPage(driver, bottomNavigationBarFinder, 'Notifications',
          notificationsPageFinder);
      await _selectPage(
          driver, bottomNavigationBarFinder, 'Settings', settingsPageFinder);
      await _selectPage(
          driver, bottomNavigationBarFinder, 'Home', homePageFinder);
    });

    test('increment counter on home page', () async {
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 1 time(s)');
    });

    test('increment counter on dashboard page', () async {
      await _selectPage(
          driver, bottomNavigationBarFinder, 'Dashboard', dashboardPageFinder);
      expect(await driver.getText(dashboardPageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(dashboardPageCounterFinder),
          'You have pushed the button on this page 2 time(s)');
    });

    test('increment counter on notifications page', () async {
      await _selectPage(driver, bottomNavigationBarFinder, 'Notifications',
          notificationsPageFinder);
      expect(await driver.getText(notificationsPageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(notificationsPageCounterFinder),
          'You have pushed the button on this page 3 time(s)');
    });

    test('toggle dark mode', () async {
      await _selectPage(
          driver, bottomNavigationBarFinder, 'Settings', settingsPageFinder);
      await driver.tap(useDarkModeSettingFinder);
    });

    test('the last value of the counters on each page are as expected',
        () async {
      await _selectPage(
          driver, bottomNavigationBarFinder, 'Home', homePageFinder);
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 1 time(s)');
      await _selectPage(
          driver, bottomNavigationBarFinder, 'Dashboard', dashboardPageFinder);
      expect(await driver.getText(dashboardPageCounterFinder),
          'You have pushed the button on this page 2 time(s)');
      await _selectPage(driver, bottomNavigationBarFinder, 'Notifications',
          notificationsPageFinder);
      expect(await driver.getText(notificationsPageCounterFinder),
          'You have pushed the button on this page 3 time(s)');
    });
  });
}

Future _selectPage(
    FlutterDriver driver,
    SerializableFinder bottomNavigationBarFinder,
    String bottomNavigationBarItemText,
    SerializableFinder pageFinder) async {
  await driver.waitFor(bottomNavigationBarFinder);
  await driver.tap(find.text(bottomNavigationBarItemText));
  await driver.waitFor(pageFinder);
}
