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
  final slideshowMenuItemFinder = find.byKey(Key('slideshowMenuItem'));
  testWidgets('Increment on slideshow page', (WidgetTester tester) async {
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
    expect(slideshowMenuItemFinder, findsOneWidget);

    // switch to slideshow
    await tester.tap(slideshowMenuItemFinder);
    await tester.pumpAndSettle();

    // drawer should now be closed
    expect(drawerFinder, findsNothing);

    // should now be on slideshow page
    expect(homePageFinder, findsNothing);
    expect(galleryPageFinder, findsNothing);
    expect(slideshowPageFinder, findsOneWidget);
    expect(find.byKey(Key('slideshowPageTitle')), findsOneWidget);
    expect(find.text('You have pushed the button on this page 0 time(s)'),
        findsOneWidget);

    // increment
    await tester.tap(incrementButtonFinder);
    await tester.pump();
    expect(find.text('You have pushed the button on this page 1 time(s)'),
        findsOneWidget);
  });
}
