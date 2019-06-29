import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_bottomnavigation_provider_mobx/constants/keys.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/notifications_page.dart';
import 'package:material_bottomnavigation_provider_mobx/stores/notifications_store.dart';
import 'package:provider/provider.dart';

void main() {
  final pageFinder = find.byType(NotificationsPage);
  group('NotificationsPage', () {
    testWidgets('Counter updates', (WidgetTester tester) async {
      var store = NotificationsStore();

      await tester.pumpWidget(
        Provider<NotificationsStore>(
          builder: (_) => store,
          child: MaterialApp(
            home: NotificationsPage(),
          ),
        ),
      );

      expect(pageFinder, findsOneWidget);
      expect(find.byKey(Keys.notificationsPageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);

      store.increment();
      await tester.pump();
      expect(find.text('You have pushed the button on this page 1 time(s)'),
          findsOneWidget);
    });
  });
}
