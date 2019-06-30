import 'package:material_navigationdrawer_provider_mobx/services/preferences_service.dart';
import 'package:material_navigationdrawer_provider_mobx/stores/settings_store.dart';
import 'package:test/test.dart';
import '../mocks/mock_shared_preferences.dart';

void main() {
  group('SlideshowStore', () {
    SettingsStore store;
    setUpAll(() {
      store = SettingsStore(PreferencesService(MockedSharedPreferences()));
    });
    test('Use dark mode settings default to off', () {
      expect(store.useDarkMode, false);
    });
    test('Turning on dark mode works', () {
      store.setDarkMode(true);
      expect(store.useDarkMode, true);
    });
  });
}
