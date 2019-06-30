// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$SettingsStore on SettingsStoreBase, Store {
  final _$useDarkModeAtom = Atom(name: 'SettingsStoreBase.useDarkMode');

  @override
  bool get useDarkMode {
    _$useDarkModeAtom.context.enforceReadPolicy(_$useDarkModeAtom);
    _$useDarkModeAtom.reportObserved();
    return super.useDarkMode;
  }

  @override
  set useDarkMode(bool value) {
    _$useDarkModeAtom.context.conditionallyRunInAction(() {
      super.useDarkMode = value;
      _$useDarkModeAtom.reportChanged();
    }, _$useDarkModeAtom, name: '${_$useDarkModeAtom.name}_set');
  }

  final _$SettingsStoreBaseActionController =
      ActionController(name: 'SettingsStoreBase');

  @override
  void setDarkMode(bool updatedDarkModePreference) {
    final _$actionInfo = _$SettingsStoreBaseActionController.startAction();
    try {
      return super.setDarkMode(updatedDarkModePreference);
    } finally {
      _$SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
