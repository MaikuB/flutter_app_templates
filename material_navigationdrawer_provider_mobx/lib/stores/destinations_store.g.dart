// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destinations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$DestinationsStore on DestinationsStoreBase, Store {
  Computed<int> _$selectedDestinationIndexComputed;

  @override
  int get selectedDestinationIndex => (_$selectedDestinationIndexComputed ??=
          Computed<int>(() => super.selectedDestinationIndex))
      .value;

  final _$selectedDestinationAtom =
      Atom(name: 'DestinationsStoreBase.selectedDestination');

  @override
  Destination get selectedDestination {
    _$selectedDestinationAtom.context
        .enforceReadPolicy(_$selectedDestinationAtom);
    _$selectedDestinationAtom.reportObserved();
    return super.selectedDestination;
  }

  @override
  set selectedDestination(Destination value) {
    // Since we are conditionally wrapping within an Action, there is no need to enforceWritePolicy
    _$selectedDestinationAtom.context.conditionallyRunInAction(() {
      super.selectedDestination = value;
      _$selectedDestinationAtom.reportChanged();
    }, name: '${_$selectedDestinationAtom.name}_set');
  }

  final _$DestinationsStoreBaseActionController =
      ActionController(name: 'DestinationsStoreBase');

  @override
  void selectDestination(Destination destination) {
    final _$actionInfo = _$DestinationsStoreBaseActionController.startAction();
    try {
      return super.selectDestination(destination);
    } finally {
      _$DestinationsStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
