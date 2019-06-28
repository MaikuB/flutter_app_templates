import 'package:mobx/mobx.dart';

part 'gallery_store.g.dart';

class GalleryStore = GalleryStoreBase with _$GalleryStore;

abstract class GalleryStoreBase with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}
