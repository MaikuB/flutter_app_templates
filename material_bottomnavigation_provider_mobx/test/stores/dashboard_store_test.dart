import 'package:material_bottomnavigation_provider_mobx/stores/dashboard_store.dart';
import 'package:test/test.dart';

void main() {
  group('Dashboard store', () {
    DashboardStore store;
    setUpAll(() {
      store = DashboardStore();
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
