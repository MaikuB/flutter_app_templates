import 'package:material_bottomnavigation_provider_mobx/stores/notifications_store.dart';
import 'package:test/test.dart';

void main() {
  group('Notifications store', () {
    NotificationsStore store;
    setUpAll(() {
      store = NotificationsStore();
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
