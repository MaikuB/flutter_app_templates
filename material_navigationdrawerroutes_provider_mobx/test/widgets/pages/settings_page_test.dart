import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/constants/keys.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/pages/settings_page.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/services/preferences_service.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/stores/settings_store.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../mocks/mock_shared_preferences.dart';

void main() {
  group('SettingsPage', () {
    final mockedSharedPreferences = MockedSharedPreferences();
    final preferencesService = PreferencesService(mockedSharedPreferences);
    var store = SettingsStore(preferencesService);
    final pageFinder = find.byType(SettingsPage);
    final useDarkModeSettingFinder = find.byKey(Keys.useDarkModeSettingKey);
    testWidgets('Counter updates', (WidgetTester tester) async {
      await tester.pumpWidget(
        Provider<SettingsStore>(
          builder: (_) => store,
          child: MaterialApp(
            home: SettingsPage(),
          ),
        ),
      );

      expect(pageFinder, findsOneWidget);
      expect(useDarkModeSettingFinder, findsOneWidget);
      expect(store.useDarkMode, false);

      await tester.tap(useDarkModeSettingFinder);
      await tester.pumpAndSettle();
      expect(store.useDarkMode, true);
    });
  });
}
