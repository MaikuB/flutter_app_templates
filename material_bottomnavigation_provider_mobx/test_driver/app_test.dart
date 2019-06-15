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
      print(health.status);
    });

    test('starts on home page', () async {
      await driver.waitFor(find.byValueKey('homePage'));
      print('on the home page');
    });

    test('switching pages works', () async {
      await _switchToDashboardPage(driver, bottomNavigationBarFinder);
      await _switchToNotificationsPage(driver, bottomNavigationBarFinder);
      await _switchToHomePage(driver, bottomNavigationBarFinder);
    });

    test('increment counter on home page', () async {
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      print('counter on home page starts at 0');
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(homePageCounterFinder),
          'You have pushed the button on this page 1 time(s)');
      print('counter on home page is now set to 1');
    });

    test('increment counter on dashboard page', () async {
      await _switchToDashboardPage(driver, bottomNavigationBarFinder);
      expect(await driver.getText(dashboardPageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      print('counter on dashboard page starts at 0');
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(dashboardPageCounterFinder),
          'You have pushed the button on this page 2 time(s)');
      print('counter on dashboard page is now set to 2');
    });

    test('increment counter on notifications page', () async {
      await _switchToNotificationsPage(driver, bottomNavigationBarFinder);
      expect(await driver.getText(notificationsPageCounterFinder),
          'You have pushed the button on this page 0 time(s)');
      print('counter on notifications page starts at 0');
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      await driver.tap(incrementButtonFinder);
      expect(await driver.getText(notificationsPageCounterFinder),
          'You have pushed the button on this page 3 time(s)');
      print('counter on notifications page is now set to 3');
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

    // group('switching views and incrementing on each view works', () async {
    //   final incrementButtonFinder = find.byValueKey('incrementButton');
    //   final homePageCounterFinder = find.byValueKey('homePageCounter');
    //   final dashboardCounterFinder = find.byValueKey('dashboardCounter');
    //   final notificationsPageCounterFinder =
    //       find.byValueKey('notificationsPageCounter');
    //   expect(await driver.getText(homePageCounterFinder),
    //       'You have pushed the button on this page 0 time(s)');
    //   print('counter on home page starts at 0');
    //   await driver.tap(incrementButtonFinder);
    //   expect(await driver.getText(homePageCounterFinder),
    //       'You have pushed the button on this page 1 time(s)');
    //   print('counter on home page is now set to 1');
    //   await _switchToDashboardPage(driver, bottomNavigationBarFinder);
    //   expect(await driver.getText(dashboardCounterFinder),
    //       'You have pushed the button on this page 0 time(s)');
    //   print('counter on dashboard page starts at 0');
    //   await driver.tap(incrementButtonFinder);
    //   await driver.tap(incrementButtonFinder);
    // });
    /*test('increments the counter', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), "1");
    });*/
  });
}

Future _switchToNotificationsPage(
    FlutterDriver driver, SerializableFinder bottomNavigationBarFinder) async {
  await driver.waitFor(bottomNavigationBarFinder);
  await driver.tap(find.text('Notifications'));
  await driver.waitFor(find.byValueKey('notificationsPageTitle'));
  print('switched to notifications page');
}

Future _switchToDashboardPage(
    FlutterDriver driver, SerializableFinder bottomNavigationBarFinder) async {
  await driver.waitFor(bottomNavigationBarFinder);
  await driver.tap(find.text('Dashboard'));
  await driver.waitFor(find.byValueKey('dashboardPageTitle'));
  print('switched to dashboard page');
}

Future _switchToHomePage(
    FlutterDriver driver, SerializableFinder bottomNavigationBarFinder) async {
  await driver.waitFor(bottomNavigationBarFinder);
  await driver.tap(find.text('Home'));
  await driver.waitFor(find.byValueKey('homePageTitle'));
  print('switched to hone page');
}
