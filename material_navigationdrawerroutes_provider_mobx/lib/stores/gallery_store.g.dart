// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$GalleryStore on GalleryStoreBase, Store {
  final _$counterAtom = Atom(name: 'GalleryStoreBase.counter');

  @override
  int get counter {
    _$counterAtom.context.enforceReadPolicy(_$counterAtom);
    _$counterAtom.reportObserved();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.context.conditionallyRunInAction(() {
      super.counter = value;
      _$counterAtom.reportChanged();
    }, _$counterAtom, name: '${_$counterAtom.name}_set');
  }

  final _$GalleryStoreBaseActionController =
      ActionController(name: 'GalleryStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$GalleryStoreBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$GalleryStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
