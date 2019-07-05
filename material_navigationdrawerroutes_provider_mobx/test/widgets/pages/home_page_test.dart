import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/pages/home_page.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/stores/home_store.dart';
import 'package:provider/provider.dart';

void main() {
  group('HomePage', () {
    final pageFinder = find.byType(HomePage);
    final store = HomeStore();
    testWidgets('Counter starts at zero', (WidgetTester tester) async {
      await _pumpWidget(tester, store);

      expect(pageFinder, findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);
    });

    testWidgets('Counter updates', (WidgetTester tester) async {
      await _pumpWidget(tester, store);

      store.increment();
      await tester.pump();
      expect(find.text('You have pushed the button on this page 1 time(s)'),
          findsOneWidget);
    });
  });
}

Future<void> _pumpWidget(WidgetTester tester, HomeStore store) async {
  await tester.pumpWidget(
    Provider<HomeStore>(
      builder: (_) => store,
      child: MaterialApp(
        home: const HomePage(),
      ),
    ),
  );
}
