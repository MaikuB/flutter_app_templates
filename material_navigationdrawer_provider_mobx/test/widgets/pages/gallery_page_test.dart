import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawer_provider_mobx/main.dart';

void main() {
  final drawerIconFinder = find.byIcon(Icons.menu);
  final drawerFinder = find.byType(Drawer);
  final homePageFinder = find.byKey(Key('homePage'));
  final galleryPageFinder = find.byKey(Key('galleryPage'));
  final slideshowPageFinder = find.byKey(Key('slideshowPage'));
  final incrementButtonFinder = find.byKey(Key('incrementButton'));
  final galleryMenuItemFinder = find.byKey(Key('galleryMenuItem'));
  testWidgets('Increment on gallery page', (WidgetTester tester) async {
    // pump app in
    await tester.pumpWidget(App());
    expect(drawerIconFinder, findsOneWidget);
    expect(drawerFinder, findsNothing);
    expect(homePageFinder, findsOneWidget);
    expect(galleryPageFinder, findsNothing);
    expect(slideshowPageFinder, findsNothing);

    // open the drawer
    await tester.tap(drawerIconFinder);

    // wait for drawer animation to finish
    await tester.pumpAndSettle();
    expect(drawerFinder, findsOneWidget);
    expect(galleryMenuItemFinder, findsOneWidget);

    // switch to gallery page
    await tester.tap(galleryMenuItemFinder);
    await tester.pumpAndSettle();

    // drawer should now be closed
    expect(drawerFinder, findsNothing);

    // should now be on gallery page
    expect(homePageFinder, findsNothing);
    expect(galleryPageFinder, findsOneWidget);
    expect(slideshowPageFinder, findsNothing);
    expect(find.byKey(Key('galleryPageTitle')), findsOneWidget);
    expect(find.text('You have pushed the button on this page 0 time(s)'),
        findsOneWidget);

    await tester.tap(incrementButtonFinder);
    await tester.pump();
    expect(find.text('You have pushed the button on this page 1 time(s)'),
        findsOneWidget);
  });
}
