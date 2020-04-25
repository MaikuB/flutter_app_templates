import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawer_provider_mobx/pages/slideshow_page.dart';
import 'package:material_navigationdrawer_provider_mobx/stores/slideshow_store.dart';
import 'package:provider/provider.dart';

void main() {
  group('SlideshowPage', () {
    final pageFinder = find.byType(SlideshowPage);
    final store = SlideshowStore();

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

Future<void> _pumpWidget(WidgetTester tester, SlideshowStore store) async {
  await tester.pumpWidget(
    Provider<SlideshowStore>(
      create: (_) => store,
      child: MaterialApp(
        home: Consumer<SlideshowStore>(
          builder: (_, store, __) => SlideshowPage(store),
        ),
      ),
    ),
  );
}
