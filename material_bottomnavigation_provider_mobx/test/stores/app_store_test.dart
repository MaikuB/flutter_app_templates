import 'package:material_bottomnavigation_provider_mobx/constants/enums.dart';
import 'package:material_bottomnavigation_provider_mobx/stores/app_store.dart';
import 'package:test/test.dart';

void main() {
  group('App store', () {
    AppStore store;
    setUpAll(() {
      store = AppStore();
    });
    test('starts at home option', () {
      expect(store.selectedBottomNavigationMenuIndex, 0);
      expect(store.selectedBottomNavigationMenuOption,
          BottomNavigationDestination.Home);
    });
    test('select at dashboard option works', () {
      store.selectBottomNavigationMenuOption(1);
      expect(store.selectedBottomNavigationMenuIndex, 1);
      expect(store.selectedBottomNavigationMenuOption,
          BottomNavigationDestination.Dashboard);
    });
    test('select at notifications option works', () {
      store.selectBottomNavigationMenuOption(2);
      expect(store.selectedBottomNavigationMenuIndex, 2);
      expect(store.selectedBottomNavigationMenuOption,
          BottomNavigationDestination.Notifications);
    });
  });
}
