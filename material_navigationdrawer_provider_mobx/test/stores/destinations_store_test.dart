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
      expect(store.selectedDestinationIndex, 0);
      expect(store.selectedDestination, Destination.Home);
    });
    test('select home destination works', () {
      store.selectDestination(Destination.Home);
      expect(store.selectedDestinationIndex, 0);
      expect(store.selectedDestination, Destination.Home);
    });
    test('select gallery destination works', () {
      store.selectDestination(Destination.Gallery);
      expect(store.selectedDestinationIndex, 1);
      expect(store.selectedDestination, Destination.Gallery);
    });
    test('select slideshow destination works', () {
      store.selectDestination(Destination.Slideshow);
      expect(store.selectedDestinationIndex, 2);
      expect(store.selectedDestination, Destination.Slideshow);
    });
  });
}
