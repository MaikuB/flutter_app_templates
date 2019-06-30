import 'package:material_navigationdrawer_provider_mobx/stores/gallery_store.dart';
import 'package:test/test.dart';

void main() {
  group('GalleryStore', () {
    GalleryStore store;
    setUpAll(() {
      store = GalleryStore();
    });
    test('Counter starts at 0', () {
      expect(store.counter, 0);
    });
    test('Increment works', () {
      store.increment();
      expect(store.counter, 1);
    });
  });
}
