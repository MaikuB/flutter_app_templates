import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/pages/settings_page.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/constants/keys.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/main.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/pages/gallery_page.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/pages/home_page.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/pages/slideshow_page.dart';
import '../mocks/mock_shared_preferences.dart';

void main() async {
  group('App', () {
    final drawerMenuButtonFinder = find.byTooltip('Open navigation menu');
    final backButtonFinder = find.byTooltip('Back');
    final drawerFinder = find.byType(Drawer);
    final homePageFinder = find.byType(HomePage);
    final galleryPageFinder = find.byType(GalleryPage);
    final slideshowPageFinder = find.byType(SlideshowPage);
    final settingsPageFinder = find.byType(SettingsPage);
    final incrementButtonFinder = find.byType(FloatingActionButton);
    final homeIconFinder = find.byIcon(Icons.home);
    final galleryIconFinder = find.byIcon(Icons.photo_library);
    final slideshowIconFinder = find.byIcon(Icons.slideshow);
    final settingsIconFinder = find.byIcon(Icons.settings);
    final sharedPreferences = MockedSharedPreferences();
    testWidgets('Starts on home page with drawer closed',
        (WidgetTester tester) async {
      await tester.pumpWidget(App(sharedPreferences));
      expect(drawerMenuButtonFinder, findsOneWidget);
      expect(drawerFinder, findsNothing);
      expect(homePageFinder, findsOneWidget);
      expect(galleryPageFinder, findsNothing);
      expect(slideshowPageFinder, findsNothing);
    });

    testWidgets('Floating action button exists', (WidgetTester tester) async {
      await tester.pumpWidget(App(sharedPreferences));
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Drawer exists', (WidgetTester tester) async {
      await tester.pumpWidget(App(sharedPreferences));
      await openDrawer(
          tester,
          drawerMenuButtonFinder,
          drawerFinder,
          homeIconFinder,
          galleryIconFinder,
          slideshowIconFinder,
          settingsIconFinder);
    });

    testWidgets('Select home page', (WidgetTester tester) async {
      await tester.pumpWidget(App(sharedPreferences));
      await openDrawer(
          tester,
          drawerMenuButtonFinder,
          drawerFinder,
          homeIconFinder,
          galleryIconFinder,
          slideshowIconFinder,
          settingsIconFinder);

      // select home page
      await tester.tap(homeIconFinder);
      await tester.pumpAndSettle();

      expect(drawerMenuButtonFinder, findsOneWidget);
      expect(drawerFinder, findsNothing);
      expect(backButtonFinder, findsNothing);

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
      await tester.pumpWidget(App(sharedPreferences));
      await openDrawer(
          tester,
          drawerMenuButtonFinder,
          drawerFinder,
          homeIconFinder,
          galleryIconFinder,
          slideshowIconFinder,
          settingsIconFinder);

      // select gallery page
      await tester.tap(galleryIconFinder);
      await tester.pumpAndSettle();

      // drawer should now be closed
      expect(drawerFinder, findsNothing);
      expect(backButtonFinder, findsOneWidget);

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
      await tester.pumpWidget(App(sharedPreferences));
      await openDrawer(
          tester,
          drawerMenuButtonFinder,
          drawerFinder,
          homeIconFinder,
          galleryIconFinder,
          slideshowIconFinder,
          settingsIconFinder);

      // select slideshow page
      await tester.tap(slideshowIconFinder);
      await tester.pumpAndSettle();

      // drawer should now be closed
      expect(drawerFinder, findsNothing);
      expect(backButtonFinder, findsOneWidget);

      // should now be on slideshow page
      expect(homePageFinder, findsNothing);
      expect(galleryPageFinder, findsNothing);
      expect(slideshowPageFinder, findsOneWidget);
      expect(find.byKey(Keys.slideshowPageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
      expect(incrementButtonFinder, findsOneWidget);
    });

    testWidgets('Select settings page', (WidgetTester tester) async {
      await tester.pumpWidget(App(sharedPreferences));
      await openDrawer(
          tester,
          drawerMenuButtonFinder,
          drawerFinder,
          homeIconFinder,
          galleryIconFinder,
          slideshowIconFinder,
          settingsIconFinder);

      // select settings page
      await tester.tap(settingsIconFinder);
      await tester.pumpAndSettle();

      // drawer should now be closed
      expect(drawerFinder, findsNothing);
      expect(backButtonFinder, findsOneWidget);

      // should now be on slideshow page
      expect(homePageFinder, findsNothing);
      expect(galleryPageFinder, findsNothing);
      expect(slideshowPageFinder, findsNothing);
      expect(settingsPageFinder, findsOneWidget);
      expect(find.byKey(Keys.settingsPageKey), findsOneWidget);
      expect(find.byType(SwitchListTile), findsOneWidget);
    });
  });
}

Future openDrawer(
    WidgetTester tester,
    Finder drawerMenuButtonFinder,
    Finder drawerFinder,
    Finder homeDrawerItemFinder,
    Finder galleryDrawerItemFinder,
    Finder slideshowDrawerItemFinder,
    Finder settingsDrawerItemFinder) async {
  // open the drawer
  await tester.tap(drawerMenuButtonFinder);
  // wait for drawer animation to finish
  await tester.pumpAndSettle();
  expect(drawerFinder, findsOneWidget);
  expect(homeDrawerItemFinder, findsOneWidget);
  expect(galleryDrawerItemFinder, findsOneWidget);
  expect(slideshowDrawerItemFinder, findsOneWidget);
  expect(settingsDrawerItemFinder, findsOneWidget);
}
