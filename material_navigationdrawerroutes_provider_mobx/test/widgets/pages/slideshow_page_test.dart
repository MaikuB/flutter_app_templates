import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/pages/slideshow_page.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/stores/slideshow_store.dart';
import 'package:provider/provider.dart';

void main() {
  group('SlideshowPage', () {
    final slideshowPageFinder = find.byType(SlideshowPage);
    var store = SlideshowStore();
    testWidgets('Counter updates', (WidgetTester tester) async {
      await tester.pumpWidget(
        Provider<SlideshowStore>(
          builder: (_) => store,
          child: MaterialApp(
            home: SlideshowPage(),
          ),
        ),
      );

      expect(slideshowPageFinder, findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);

      store.increment();
      await tester.pump();
      expect(find.text('You have pushed the button on this page 1 time(s)'),
          findsOneWidget);
    });
  });
}
