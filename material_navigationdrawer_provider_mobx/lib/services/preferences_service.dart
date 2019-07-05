import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  const PreferencesService(this._sharedPreferences);

  final String _useDarkModeKey = 'useDarkMode';
  final SharedPreferences _sharedPreferences;

  set useDarkMode(bool useDarkMode) {
    _sharedPreferences.setBool(_useDarkModeKey, useDarkMode);
  }

  bool get useDarkMode => _sharedPreferences.getBool(_useDarkModeKey) ?? false;
}
