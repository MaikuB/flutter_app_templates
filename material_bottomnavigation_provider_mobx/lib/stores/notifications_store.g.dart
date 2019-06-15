// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$NotificationsStore on NotificationsStoreBase, Store {
  final _$counterAtom = Atom(name: 'NotificationsStoreBase.counter');

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

  final _$NotificationsStoreBaseActionController =
      ActionController(name: 'NotificationsStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$NotificationsStoreBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$NotificationsStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
