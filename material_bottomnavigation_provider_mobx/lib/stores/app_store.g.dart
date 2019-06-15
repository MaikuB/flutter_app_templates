// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AppStore on AppStoreBase, Store {
  Computed<BottomNavigationDestination>
      _$selectedBottomNavigationMenuOptionComputed;

  @override
  BottomNavigationDestination get selectedBottomNavigationMenuOption =>
      (_$selectedBottomNavigationMenuOptionComputed ??=
              Computed<BottomNavigationDestination>(
                  () => super.selectedBottomNavigationMenuOption))
          .value;

  final _$selectedBottomNavigationMenuIndexAtom =
      Atom(name: 'AppStoreBase.selectedBottomNavigationMenuIndex');

  @override
  int get selectedBottomNavigationMenuIndex {
    _$selectedBottomNavigationMenuIndexAtom.reportObserved();
    return super.selectedBottomNavigationMenuIndex;
  }

  @override
  set selectedBottomNavigationMenuIndex(int value) {
    _$selectedBottomNavigationMenuIndexAtom.context
        .checkIfStateModificationsAreAllowed(
            _$selectedBottomNavigationMenuIndexAtom);
    super.selectedBottomNavigationMenuIndex = value;
    _$selectedBottomNavigationMenuIndexAtom.reportChanged();
  }

  final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase');

  @override
  void selectBottomNavigationMenuOption(int index) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction();
    try {
      return super.selectBottomNavigationMenuOption(index);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
