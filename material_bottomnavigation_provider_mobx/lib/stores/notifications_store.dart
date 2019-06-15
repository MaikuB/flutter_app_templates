import 'package:mobx/mobx.dart';

part 'notifications_store.g.dart';

class NotificationsStore = NotificationsStoreBase with _$NotificationsStore;

abstract class NotificationsStoreBase with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}
