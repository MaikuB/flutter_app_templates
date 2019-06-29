import 'package:material_navigationdrawerroutes_provider_mobx/constants/routes.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/stores/destinations_store.dart';
import 'package:test/test.dart';

void main() {
  group('Destinations store', () {
    DestinationsStore store;
    setUpAll(() {
      store = DestinationsStore();
    });
    test('starts at home', () {
      expect(store.selectedDestination, Routes.home);
    });
    test('select home destination works', () {
      _selectAndExpectRoute(store, Routes.home);
    });
    test('select gallery destination works', () {
      _selectAndExpectRoute(store, Routes.gallery);
    });
    test('select slideshow destination works', () {
      _selectAndExpectRoute(store, Routes.slideshow);
    });
  });
}

void _selectAndExpectRoute(DestinationsStore store, String route) {
  store.selectDestination(route);
  expect(store.selectedDestination, route);
}
