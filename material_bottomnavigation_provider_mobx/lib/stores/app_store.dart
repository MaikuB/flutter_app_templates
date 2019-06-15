import 'package:mobx/mobx.dart';
import '../constants/enums.dart';
part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  static final List<BottomNavigationDestination> bottomNavigationDestinations =
      BottomNavigationDestination.values;

  @observable
  int selectedBottomNavigationDestinationIndex =
      bottomNavigationDestinations.indexOf(BottomNavigationDestination.Home);

  @computed
  BottomNavigationDestination get selectedBottomNavigationDestination =>
      bottomNavigationDestinations[selectedBottomNavigationDestinationIndex];

  @action
  void selectBottomNavigationDestination(int index) {
    selectedBottomNavigationDestinationIndex = index;
  }
}
