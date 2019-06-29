import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawer_provider_mobx/constants/keys.dart';
import 'package:material_navigationdrawer_provider_mobx/main.dart';
import 'package:material_navigationdrawer_provider_mobx/pages/gallery_page.dart';
import 'package:material_navigationdrawer_provider_mobx/pages/home_page.dart';
import 'package:material_navigationdrawer_provider_mobx/pages/slideshow_page.dart';

void main() {
  group('App', () {
    final drawerIconFinder = find.byIcon(Icons.menu);
    final drawerFinder = find.byType(Drawer);
    final homePageFinder = find.byType(HomePage);
    final galleryPageFinder = find.byType(GalleryPage);
    final slideshowPageFinder = find.byType(SlideshowPage);
    final incrementButtonFinder = find.byType(FloatingActionButton);
    final homeIconFinder = find.byIcon(Icons.home);
    final galleryIconFinder = find.byIcon(Icons.photo_library);
    final slideshowIconFinder = find.byIcon(Icons.slideshow);

    testWidgets('Starts on home page with drawer closed',
        (WidgetTester tester) async {
      await tester.pumpWidget(App());
      expect(drawerIconFinder, findsOneWidget);
      expect(drawerFinder, findsNothing);
      expect(homePageFinder, findsOneWidget);
      expect(galleryPageFinder, findsNothing);
      expect(slideshowPageFinder, findsNothing);
    });

    testWidgets('Floating action button exists', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Drawer exists', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      await openDrawer(tester, drawerIconFinder, drawerFinder, homeIconFinder,
          galleryIconFinder, slideshowIconFinder);
    });

    testWidgets('Select home page', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      await openDrawer(tester, drawerIconFinder, drawerFinder, homeIconFinder,
          galleryIconFinder, slideshowIconFinder);

      // switch to gallery page
      await tester.tap(homeIconFinder);
      await tester.pumpAndSettle();

      // drawer should now be closed
      expect(drawerFinder, findsNothing);

      // should now be on home page
      expect(homePageFinder, findsOneWidget);
      expect(galleryPageFinder, findsNothing);
      expect(slideshowPageFinder, findsNothing);
      expect(find.byKey(Keys.homePageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Select gallery page', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      await openDrawer(tester, drawerIconFinder, drawerFinder, homeIconFinder,
          galleryIconFinder, slideshowIconFinder);

      // switch to gallery page
      await tester.tap(galleryIconFinder);
      await tester.pumpAndSettle();

      // drawer should now be closed
      expect(drawerFinder, findsNothing);

      // should now be on gallery page
      expect(homePageFinder, findsNothing);
      expect(galleryPageFinder, findsOneWidget);
      expect(slideshowPageFinder, findsNothing);
      expect(find.byKey(Keys.galleryPageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Select slideshow page', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      await openDrawer(tester, drawerIconFinder, drawerFinder, homeIconFinder,
          galleryIconFinder, slideshowIconFinder);

      // switch to gallery page
      await tester.tap(slideshowIconFinder);
      await tester.pumpAndSettle();

      // drawer should now be closed
      expect(drawerFinder, findsNothing);

      // should now be on slideshow page
      expect(homePageFinder, findsNothing);
      expect(galleryPageFinder, findsNothing);
      expect(slideshowPageFinder, findsOneWidget);
      expect(find.byKey(Keys.slideshowPageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
      expect(incrementButtonFinder, findsOneWidget);
    });
  });
}

Future openDrawer(
    WidgetTester tester,
    Finder drawerIconFinder,
    Finder drawerFinder,
    Finder homeMenuItemFinder,
    Finder galleryMenuItemFinder,
    Finder slideshowMenuItemFinder) async {
  // open the drawer
  await tester.tap(drawerIconFinder);
  // wait for drawer animation to finish
  await tester.pumpAndSettle();
  expect(drawerFinder, findsOneWidget);
  expect(homeMenuItemFinder, findsOneWidget);
  expect(galleryMenuItemFinder, findsOneWidget);
  expect(slideshowMenuItemFinder, findsOneWidget);
}
