// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$HomeStore on HomeStoreBase, Store {
  final _$counterAtom = Atom(name: 'HomeStoreBase.counter');

  @override
  int get counter {
    _$counterAtom.reportObserved();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.context.checkIfStateModificationsAreAllowed(_$counterAtom);
    super.counter = value;
    _$counterAtom.reportChanged();
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
