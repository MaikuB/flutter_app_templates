import 'package:mobx/mobx.dart';
import '../services/preferences_service.dart';
part 'settings_store.g.dart';

class SettingsStore = SettingsStoreBase with _$SettingsStore;

abstract class SettingsStoreBase with Store {
  PreferencesService _preferencesService;

  @observable
  bool useDarkMode;

  /// when the store is created, we read in the current settings immediately to avoid the scenario where
  /// the values displayed will change upon switching to the settings tab
  SettingsStoreBase(this._preferencesService) {
    useDarkMode = _preferencesService.useDarkMode;
  }

  @action
  void setDarkMode(bool updatedDarkModePreference) {
    _preferencesService.useDarkMode = updatedDarkModePreference;
    useDarkMode = updatedDarkModePreference;
  }
}
