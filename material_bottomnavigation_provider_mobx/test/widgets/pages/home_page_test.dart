import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_bottomnavigation_provider_mobx/app.dart';

void main() {
  final homePageFinder = find.byKey(Key('homePage'));
  final dashboardPageFinder = find.byKey(Key('dashboardPage'));
  final notificationsPageFinder = find.byKey(Key('notificationsPage'));
  final incrementButtonFinder = find.byKey(Key('incrementButton'));
  testWidgets('Increment on home page', (WidgetTester tester) async {
    // check that home page is the one that's visible
    await tester.pumpWidget(App());
    expect(homePageFinder, findsOneWidget);
    expect(dashboardPageFinder, findsNothing);
    expect(notificationsPageFinder, findsNothing);
    expect(find.byKey(Key('homePageTitle')), findsOneWidget);
    expect(find.text('You have pushed the button on this page 0 time(s)'),
        findsOneWidget);
    await tester.tap(incrementButtonFinder);
    await tester.pump();
    expect(find.text('You have pushed the button on this page 1 time(s)'),
        findsOneWidget);
  });
}
