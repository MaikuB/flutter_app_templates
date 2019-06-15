// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App', () {
    FlutterDriver driver;
    final bottomNavigationBarFinder = find.byValueKey('bottomNavigationBar');
    final incrementButtonFinder = find.byValueKey('incrementButton');
    final homePageCounterFinder = find.byValueKey('homePageCounter');
    final dashboardPageCounterFinder = find.byValueKey('dashboardPageCounter');
    final notificationsPageCounterFinder =
        find.byValueKey('notificationsPageCounter');
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
      await _switchToDashboardPage(driver, bottomNavigationBarFinder);
      await _switchToNotificationsPage(driver, bottomNavigationBarFinder);
      await _switchToHomePage(driver, bottomNavigationBarFinder);
    });

    test('increment counter on home page', () async {
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 1 time(s)');
    });

    test('increment counter on dashboard page', () async {
      await _switchToDashboardPage(driver, bottomNavigationBarFinder);
      expect(await driver.getText(dashboardPageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(dashboardPageCounterFinder),
          'You have pushed the button on this page 2 time(s)');
    });

    test('increment counter on notifications page', () async {
      await _switchToNotificationsPage(driver, bottomNavigationBarFinder);
      expect(await driver.getText(notificationsPageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(notificationsPageCounterFinder),
          'You have pushed the button on this page 3 time(s)');
      await _switchToHomePage(driver, bottomNavigationBarFinder);
    });

    test('the last value of the counters on each page are as expected',
        () async {
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 1 time(s)');
      await _switchToDashboardPage(driver, bottomNavigationBarFinder);
      expect(await driver.getText(dashboardPageCounterFinder),
          'You have pushed the button on this page 2 time(s)');
      await _switchToNotificationsPage(driver, bottomNavigationBarFinder);
      expect(await driver.getText(notificationsPageCounterFinder),
          'You have pushed the button on this page 3 time(s)');
    });
  });
}

Future _switchToNotificationsPage(
    FlutterDriver driver, SerializableFinder bottomNavigationBarFinder) async {
  await driver.waitFor(bottomNavigationBarFinder);
  await driver.tap(find.text('Notifications'));
  await driver.waitFor(find.byValueKey('notificationsPageTitle'));
}

Future _switchToDashboardPage(
    FlutterDriver driver, SerializableFinder bottomNavigationBarFinder) async {
  await driver.waitFor(bottomNavigationBarFinder);
  await driver.tap(find.text('Dashboard'));
  await driver.waitFor(find.byValueKey('dashboardPageTitle'));
}

Future _switchToHomePage(
    FlutterDriver driver, SerializableFinder bottomNavigationBarFinder) async {
  await driver.waitFor(bottomNavigationBarFinder);
  await driver.tap(find.text('Home'));
  await driver.waitFor(find.byValueKey('homePageTitle'));
}
