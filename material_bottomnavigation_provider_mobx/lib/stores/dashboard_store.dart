import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';

class DashboardStore = DashboardStoreBase with _$DashboardStore;

abstract class DashboardStoreBase with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}
