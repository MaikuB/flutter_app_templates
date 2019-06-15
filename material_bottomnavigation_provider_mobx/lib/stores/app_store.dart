import 'package:mobx/mobx.dart';
import '../constants/enums.dart';
part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  List<BottomNavigationDestination> bottomNavigationMenuOptions =
      BottomNavigationDestination.values;

  @observable
  int selectedBottomNavigationMenuIndex = 0;

  @computed
  BottomNavigationDestination get selectedBottomNavigationMenuOption =>
      bottomNavigationMenuOptions[selectedBottomNavigationMenuIndex];

  @action
  void selectBottomNavigationMenuOption(int index) {
    selectedBottomNavigationMenuIndex = index;
  }
}
