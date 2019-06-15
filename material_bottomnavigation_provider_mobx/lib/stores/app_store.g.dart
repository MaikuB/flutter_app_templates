// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AppStore on AppStoreBase, Store {
  Computed<BottomNavigationDestination>
      _$selectedBottomNavigationDestinationComputed;

  @override
  BottomNavigationDestination get selectedBottomNavigationDestination =>
      (_$selectedBottomNavigationDestinationComputed ??=
              Computed<BottomNavigationDestination>(
                  () => super.selectedBottomNavigationDestination))
          .value;

  final _$selectedBottomNavigationDestinationIndexAtom =
      Atom(name: 'AppStoreBase.selectedBottomNavigationDestinationIndex');

  @override
  int get selectedBottomNavigationDestinationIndex {
    _$selectedBottomNavigationDestinationIndexAtom.reportObserved();
    return super.selectedBottomNavigationDestinationIndex;
  }

  @override
  set selectedBottomNavigationDestinationIndex(int value) {
    _$selectedBottomNavigationDestinationIndexAtom.context
        .checkIfStateModificationsAreAllowed(
            _$selectedBottomNavigationDestinationIndexAtom);
    super.selectedBottomNavigationDestinationIndex = value;
    _$selectedBottomNavigationDestinationIndexAtom.reportChanged();
  }

  final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase');

  @override
  void selectBottomNavigationDestination(int index) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction();
    try {
      return super.selectBottomNavigationDestination(index);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
