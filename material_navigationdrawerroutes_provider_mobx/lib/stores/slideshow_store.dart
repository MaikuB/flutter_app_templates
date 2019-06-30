import 'package:mobx/mobx.dart';

part 'slideshow_store.g.dart';

class SlideshowStore = SlideshowStoreBase with _$SlideshowStore;

abstract class SlideshowStoreBase with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}
