import 'package:material_navigationdrawer_provider_mobx/constants/enums.dart';
import 'package:material_navigationdrawer_provider_mobx/stores/destinations_store.dart';
import 'package:test/test.dart';

void main() {
  group('Destinations store', () {
    DestinationsStore store;
    setUpAll(() {
      store = DestinationsStore();
    });
    test('starts at home', () {
      expect(store.selectedDestination, Destination.Home);
    });
    test('select home destination works', () {
      _selectAndExpectDestination(store, Destination.Home);
    });
    test('select gallery destination works', () {
      _selectAndExpectDestination(store, Destination.Gallery);
    });
    test('select slideshow destination works', () {
      _selectAndExpectDestination(store, Destination.Slideshow);
    });
  });
}

void _selectAndExpectDestination(
    DestinationsStore store, Destination destination) {
  store.selectDestination(destination);
  expect(store.selectedDestination, destination);
}
