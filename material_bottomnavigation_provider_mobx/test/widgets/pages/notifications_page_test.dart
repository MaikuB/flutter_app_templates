import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/notifications_page.dart';
import 'package:material_bottomnavigation_provider_mobx/stores/notifications_store.dart';
import 'package:provider/provider.dart';

void main() {
  group('NotificationsPage', () {
    final pageFinder = find.byType(NotificationsPage);
    var store = NotificationsStore();

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

Future _pumpWidget(WidgetTester tester, NotificationsStore store) async {
  await tester.pumpWidget(
    Provider<NotificationsStore>(
      builder: (_) => store,
      child: MaterialApp(
        home: NotificationsPage(),
      ),
    ),
  );
}
