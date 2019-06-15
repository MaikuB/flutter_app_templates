import 'package:material_bottomnavigation_provider_mobx/stores/home_store.dart';
import 'package:test/test.dart';

void main() {
  group('Home store', () {
    HomeStore store;
    setUpAll(() {
      store = HomeStore();
    });
    test('counter starts at 0', () {
      expect(store.counter, 0);
    });
    test('increment works', () {
      store.increment();
      expect(store.counter, 1);
    });
  });
}
