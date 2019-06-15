import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_bottomnavigation_provider_mobx/main.dart';

void main() {
  final homePageFinder = find.byKey(Key('homePage'));
  final dashboardPageFinder = find.byKey(Key('dashboardPage'));
  final notificationsPageFinder = find.byKey(Key('notificationsPage'));
  final dashboardIconFinder = find.byIcon(Icons.dashboard);
  final incrementButtonFinder = find.byKey(Key('incrementButton'));
  testWidgets('Increment on dashboard page', (WidgetTester tester) async {
    // pump app in
    await tester.pumpWidget(App());
    // check that home page is the one that's visible
    expect(homePageFinder, findsOneWidget);
    expect(dashboardPageFinder, findsNothing);
    expect(notificationsPageFinder, findsNothing);

    // switch to dashboard page
    await tester.tap(dashboardIconFinder);

    // now on the dashboard page
    await tester.pump();
    expect(find.byKey(Key('dashboardPageTitle')), findsOneWidget);
    expect(find.text('You have pushed the button on this page 0 time(s)'),
        findsOneWidget);
    await tester.tap(incrementButtonFinder);
    await tester.pump();
    expect(find.text('You have pushed the button on this page 1 time(s)'),
        findsOneWidget);
  });
}
