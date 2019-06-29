import 'package:material_navigationdrawerroutes_provider_mobx/stores/slideshow_store.dart';
import 'package:test/test.dart';

void main() {
  group('SlideshowStore', () {
    SlideshowStore store;
    setUpAll(() {
      store = SlideshowStore();
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
