import 'package:material_navigationdrawerroutes_provider_mobx/constants/routes.dart';
import 'package:mobx/mobx.dart';

part 'destinations_store.g.dart';

class DestinationsStore = DestinationsStoreBase with _$DestinationsStore;

abstract class DestinationsStoreBase with Store {
  static final List<String> destinations = [
    Routes.home,
    Routes.gallery,
    Routes.slideshow
  ];

  @observable
  String selectedDestination = destinations[0];

  @action
  void selectDestination(String destination) {
    selectedDestination = destination;
  }
}
