import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_bottomnavigation_provider_mobx/constants/keys.dart';
import 'package:material_bottomnavigation_provider_mobx/pages/dashboard_page.dart';
import 'package:material_bottomnavigation_provider_mobx/stores/dashboard_store.dart';
import 'package:provider/provider.dart';

void main() {
  final pageFinder = find.byType(DashboardPage);
  group('DashboardPage', () {
    testWidgets('Counter updates', (WidgetTester tester) async {
      var store = DashboardStore();

      await tester.pumpWidget(
        Provider<DashboardStore>(
          builder: (_) => store,
          child: MaterialApp(
            home: DashboardPage(),
          ),
        ),
      );

      expect(pageFinder, findsOneWidget);
      expect(find.byKey(Keys.dashboardPageTitleKey), findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);

      store.increment();
      await tester.pump();
      expect(find.text('You have pushed the button on this page 1 time(s)'),
          findsOneWidget);
    });
  });
}
