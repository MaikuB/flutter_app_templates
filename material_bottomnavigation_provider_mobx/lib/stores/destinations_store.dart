import 'package:mobx/mobx.dart';
import '../constants/enums.dart';
part 'destinations_store.g.dart';

class DestinationsStore = DestinationsStoreBase with _$DestinationsStore;

abstract class DestinationsStoreBase with Store {
  static final List<Destination> bottomNavigationDestinations =
      Destination.values;

  @observable
  int selectedDestinationIndex =
      bottomNavigationDestinations.indexOf(Destination.Home);

  @computed
  Destination get selectedDestination =>
      bottomNavigationDestinations[selectedDestinationIndex];

  @action
  void selectDestination(int index) {
    selectedDestinationIndex = index;
  }
}
