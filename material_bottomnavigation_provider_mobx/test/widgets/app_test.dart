import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_bottomnavigation_provider_mobx/constants/keys.dart';
import 'package:material_bottomnavigation_provider_mobx/main.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/dashboard_page.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/home_page.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/notifications_page.dart';

void main() {
  group('App', () {
    final homePageFinder = find.byType(HomePage);
    final dashboardPageFinder = find.byType(DashboardPage);
    final notificationsPageFinder = find.byType(NotificationsPage);
    final homeIconFinder = find.byIcon(Icons.home);
    final dashboardIconFinder = find.byIcon(Icons.dashboard);
    final notificationsIconFinder = find.byIcon(Icons.notifications);
    final incrementButtonFinder = find.byType(FloatingActionButton);

    testWidgets('Starts on home page', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      expect(homePageFinder, findsOneWidget);
    });

    testWidgets('Bottom navigation bar exists', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(homeIconFinder, findsOneWidget);
      expect(dashboardIconFinder, findsOneWidget);
      expect(notificationsIconFinder, findsOneWidget);
    });

    testWidgets('Floating action button exists', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Select home page', (WidgetTester tester) async {
      await tester.pumpWidget(App());

      // switch to home page
      await tester.tap(homeIconFinder);
      await tester.pump();

      // should now be on gallery page
      expect(homePageFinder, findsOneWidget);
      expect(dashboardPageFinder, findsNothing);
      expect(notificationsPageFinder, findsNothing);
      expect(find.byKey(Keys.homePageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Select dashboard page', (WidgetTester tester) async {
      await tester.pumpWidget(App());

      // switch to dashboard page
      await tester.tap(dashboardIconFinder);
      await tester.pump();

      // should now be on dashboard page
      expect(homePageFinder, findsNothing);
      expect(dashboardPageFinder, findsOneWidget);
      expect(notificationsPageFinder, findsNothing);
      expect(find.byKey(Keys.dashboardPageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Select notifications page', (WidgetTester tester) async {
      await tester.pumpWidget(App());

      // switch to notifications page
      await tester.tap(notificationsIconFinder);
      await tester.pump();

      // should now be on notifications page
      expect(homePageFinder, findsNothing);
      expect(dashboardPageFinder, findsNothing);
      expect(notificationsPageFinder, findsOneWidget);
      expect(find.byKey(Keys.notificationsPageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
      expect(incrementButtonFinder, findsOneWidget);
    });
  });
}
