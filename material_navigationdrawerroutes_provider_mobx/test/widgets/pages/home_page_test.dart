import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/pages/home_page.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/stores/home_store.dart';
import 'package:provider/provider.dart';

void main() {
  group('HomePage', () {
    final homePageFinder = find.byType(HomePage);
    var store = HomeStore();
    testWidgets('Counter updates', (WidgetTester tester) async {
      await tester.pumpWidget(
        Provider<HomeStore>(
          builder: (_) => store,
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      expect(homePageFinder, findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);

      store.increment();
      await tester.pump();
      expect(find.text('You have pushed the button on this page 1 time(s)'),
          findsOneWidget);
    });
  });
}
