import 'package:material_bottomnavigation_provider_mobx/stores/home_store.dart';
import 'package:test/test.dart';

void main() {
  group('Home store', () {
    HomeStore store;
    setUpAll(() {
      store = HomeStore();
    });
  });
}
