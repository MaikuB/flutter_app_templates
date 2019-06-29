import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_bottomnavigation_provider_mobx/constants/keys.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/home_page.dart';
import 'package:material_bottomnavigation_provider_mobx/stores/home_store.dart';
import 'package:provider/provider.dart';

void main() {
  final pageFinder = find.byType(HomePage);
  group('HomePage', () {
    testWidgets('Counter updates', (WidgetTester tester) async {
      var store = HomeStore();

      await tester.pumpWidget(
        Provider<HomeStore>(
          builder: (_) => store,
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      expect(pageFinder, findsOneWidget);
      expect(find.byKey(Keys.homePageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);

      store.increment();
      await tester.pump();
      expect(find.text('You have pushed the button on this page 1 time(s)'),
          findsOneWidget);
    });
  });
}
