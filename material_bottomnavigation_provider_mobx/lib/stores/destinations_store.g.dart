// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destinations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$DestinationsStore on DestinationsStoreBase, Store {
  Computed<Destination> _$selectedBottomNavigationDestinationComputed;

  @override
  Destination get selectedDestination =>
      (_$selectedBottomNavigationDestinationComputed ??=
              Computed<Destination>(() => super.selectedDestination))
          .value;

  final _$selectedBottomNavigationDestinationIndexAtom = Atom(
      name: 'DestinationsStoreBase.selectedBottomNavigationDestinationIndex');

  @override
  int get selectedDestinationIndex {
    _$selectedBottomNavigationDestinationIndexAtom.reportObserved();
    return super.selectedDestinationIndex;
  }

  @override
  set selectedDestinationIndex(int value) {
    _$selectedBottomNavigationDestinationIndexAtom.context
        .checkIfStateModificationsAreAllowed(
            _$selectedBottomNavigationDestinationIndexAtom);
    super.selectedDestinationIndex = value;
    _$selectedBottomNavigationDestinationIndexAtom.reportChanged();
  }

  final _$DestinationsStoreBaseActionController =
      ActionController(name: 'DestinationsStoreBase');

  @override
  void selectDestination(int index) {
    final _$actionInfo = _$DestinationsStoreBaseActionController.startAction();
    try {
      return super.selectDestination(index);
    } finally {
      _$DestinationsStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
