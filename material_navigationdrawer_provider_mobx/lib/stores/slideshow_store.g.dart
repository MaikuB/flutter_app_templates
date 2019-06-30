// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slideshow_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$SlideshowStore on SlideshowStoreBase, Store {
  final _$counterAtom = Atom(name: 'SlideshowStoreBase.counter');

  @override
  int get counter {
    _$counterAtom.context.enforceReadPolicy(_$counterAtom);
    _$counterAtom.reportObserved();
    return super.counter;
  }

  @override
  set counter(int value) {
    // Since we are conditionally wrapping within an Action, there is no need to enforceWritePolicy
    _$counterAtom.context.conditionallyRunInAction(() {
      super.counter = value;
      _$counterAtom.reportChanged();
    }, name: '${_$counterAtom.name}_set');
  }

  final _$SlideshowStoreBaseActionController =
      ActionController(name: 'SlideshowStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$SlideshowStoreBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$SlideshowStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
