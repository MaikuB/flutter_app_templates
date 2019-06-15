import 'package:mobx/mobx.dart';
import '../constants/enums.dart';
part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  List<BottomNavigationMenuOption> bottomNavigationMenuOptions =
      BottomNavigationMenuOption.values;

  @observable
  int selectedBottomNavigationMenuIndex = 0;

  @computed
  BottomNavigationMenuOption get selectedBottomNavigationMenuOption =>
      bottomNavigationMenuOptions[selectedBottomNavigationMenuIndex];

  @action
  void selectBottomNavigationMenuOption(int index) {
    selectedBottomNavigationMenuIndex = index;
  }
}
