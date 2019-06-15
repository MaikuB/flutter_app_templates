import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_bottomnavigation_provider_mobx/main.dart';

void main() {
  testWidgets('Bottom navigation bar exists', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.dashboard), findsOneWidget);
    expect(find.byIcon(Icons.notifications), findsOneWidget);
  });
  testWidgets('Floating action button exists', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
