import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawer_provider_mobx/pages/gallery_page.dart';
import 'package:material_navigationdrawer_provider_mobx/stores/gallery_store.dart';
import 'package:provider/provider.dart';

void main() {
  group('GalleryPage', () {
    final pageFinder = find.byType(GalleryPage);
    var store = GalleryStore();
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

Future _pumpWidget(WidgetTester tester, GalleryStore store) async {
  await tester.pumpWidget(
    Provider<GalleryStore>(
      builder: (_) => store,
      child: MaterialApp(
        home: GalleryPage(),
      ),
    ),
  );
}
