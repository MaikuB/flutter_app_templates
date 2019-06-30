import 'package:material_navigationdrawer_provider_mobx/stores/home_store.dart';
import 'package:test/test.dart';

void main() {
  group('HomeStore', () {
    HomeStore store;
    setUpAll(() {
      store = HomeStore();
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
