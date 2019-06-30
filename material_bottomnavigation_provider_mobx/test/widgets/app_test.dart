import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_bottomnavigation_provider_mobx/constants/keys.dart';
import 'package:material_bottomnavigation_provider_mobx/main.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/dashboard_page.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/home_page.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/notifications_page.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/settings_page.dart';
import '../mocks/mock_shared_preferences.dart';

void main() {
  group('App', () {
    final homePageFinder = find.byType(HomePage);
    final dashboardPageFinder = find.byType(DashboardPage);
    final notificationsPageFinder = find.byType(NotificationsPage);
    final settingsPageFinder = find.byType(SettingsPage);
    final homeIconFinder = find.byIcon(Icons.home);
    final dashboardIconFinder = find.byIcon(Icons.dashboard);
    final notificationsIconFinder = find.byIcon(Icons.notifications);
    final settingsIconFinder = find.byIcon(Icons.settings);
    final incrementButtonFinder = find.byType(FloatingActionButton);
    final mockedSharedPreferences = MockedSharedPreferences();

    testWidgets('Starts on home page', (WidgetTester tester) async {
      await tester.pumpWidget(App(mockedSharedPreferences));
      expect(homePageFinder, findsOneWidget);
    });

    testWidgets('Bottom navigation bar exists', (WidgetTester tester) async {
      await _pumpWidget(tester, mockedSharedPreferences);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(homeIconFinder, findsOneWidget);
      expect(dashboardIconFinder, findsOneWidget);
      expect(notificationsIconFinder, findsOneWidget);
      expect(settingsIconFinder, findsOneWidget);
    });

    testWidgets('Floating action button exists', (WidgetTester tester) async {
      await _pumpWidget(tester, mockedSharedPreferences);
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Select home page', (WidgetTester tester) async {
      await _pumpWidget(tester, mockedSharedPreferences);

      // select home page
      await tester.tap(homeIconFinder);
      await tester.pump();

      // should now be on gallery page
      expect(homePageFinder, findsOneWidget);
      expect(dashboardPageFinder, findsNothing);
      expect(notificationsPageFinder, findsNothing);
      expect(settingsPageFinder, findsNothing);
      expect(find.byKey(Keys.homePageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Select dashboard page', (WidgetTester tester) async {
      await _pumpWidget(tester, mockedSharedPreferences);

      // select dashboard page
      await tester.tap(dashboardIconFinder);
      await tester.pump();

      // should now be on dashboard page
      expect(homePageFinder, findsNothing);
      expect(dashboardPageFinder, findsOneWidget);
      expect(notificationsPageFinder, findsNothing);
      expect(settingsPageFinder, findsNothing);
      expect(find.byKey(Keys.dashboardPageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Select notifications page', (WidgetTester tester) async {
      await _pumpWidget(tester, mockedSharedPreferences);

      // select notifications page
      await tester.tap(notificationsIconFinder);
      await tester.pump();

      // should now be on notifications page
      expect(homePageFinder, findsNothing);
      expect(dashboardPageFinder, findsNothing);
      expect(notificationsPageFinder, findsOneWidget);
      expect(settingsPageFinder, findsNothing);
      expect(find.byKey(Keys.notificationsPageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Select settings page', (WidgetTester tester) async {
      await _pumpWidget(tester, mockedSharedPreferences);

      // select settings page
      await tester.tap(settingsIconFinder);
      await tester.pumpAndSettle();

      // should now be on settings page
      expect(homePageFinder, findsNothing);
      expect(dashboardPageFinder, findsNothing);
      expect(notificationsPageFinder, findsNothing);
      expect(settingsPageFinder, findsOneWidget);
      expect(find.byKey(Keys.settingsPageKey), findsOneWidget);
      expect(find.byType(SwitchListTile), findsOneWidget);
    });
  });
}

Future _pumpWidget(WidgetTester tester,
    MockedSharedPreferences mockedSharedPreferences) async {
  await tester.pumpWidget(App(mockedSharedPreferences));
}
