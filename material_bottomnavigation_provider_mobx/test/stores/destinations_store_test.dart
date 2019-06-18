import 'package:material_bottomnavigation_provider_mobx/constants/enums.dart';
import 'package:material_bottomnavigation_provider_mobx/stores/destinations_store.dart';
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
    test('select dashboard destination works', () {
      store.selectDestination(1);
      expect(store.selectedDestinationIndex, 1);
      expect(store.selectedDestination, Destination.Dashboard);
    });
    test('select notifications destination works', () {
      store.selectDestination(2);
      expect(store.selectedDestinationIndex, 2);
      expect(store.selectedDestination, Destination.Notifications);
    });
  });
}
