// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destinations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$DestinationsStore on DestinationsStoreBase, Store {
  Computed<Destination> _$selectedDestinationComputed;

  @override
  Destination get selectedDestination => (_$selectedDestinationComputed ??=
          Computed<Destination>(() => super.selectedDestination))
      .value;

  final _$selectedDestinationIndexAtom =
      Atom(name: 'DestinationsStoreBase.selectedDestinationIndex');

  @override
  int get selectedDestinationIndex {
    _$selectedDestinationIndexAtom.reportObserved();
    return super.selectedDestinationIndex;
  }

  @override
  set selectedDestinationIndex(int value) {
    _$selectedDestinationIndexAtom.context
        .checkIfStateModificationsAreAllowed(_$selectedDestinationIndexAtom);
    super.selectedDestinationIndex = value;
    _$selectedDestinationIndexAtom.reportChanged();
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
