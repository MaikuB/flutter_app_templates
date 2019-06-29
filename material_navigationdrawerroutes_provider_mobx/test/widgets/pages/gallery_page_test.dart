import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/pages/gallery_page.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/stores/gallery_store.dart';
import 'package:provider/provider.dart';

void main() {
  final galleryPageFinder = find.byType(GalleryPage);
  group('GalleryPage', () {
    testWidgets('Counter updates', (WidgetTester tester) async {
      var store = GalleryStore();

      await tester.pumpWidget(
        Provider<GalleryStore>(
          builder: (_) => store,
          child: MaterialApp(
            home: GalleryPage(),
          ),
        ),
      );

      expect(galleryPageFinder, findsOneWidget);
      expect(find.text('You have pushed the button on this page 0 time(s)'),
          findsOneWidget);

      store.increment();
      await tester.pump();
      expect(find.text('You have pushed the button on this page 1 time(s)'),
          findsOneWidget);
    });
  });
}
