import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_navigationdrawer_provider_mobx/constants/keys.dart';
import 'package:material_navigationdrawer_provider_mobx/pages/settings_page.dart';
import 'package:material_navigationdrawer_provider_mobx/services/preferences_service.dart';
import 'package:material_navigationdrawer_provider_mobx/stores/settings_store.dart';
import 'package:provider/provider.dart';
import '../../mocks/mock_shared_preferences.dart';

void main() {
  group('SettingsPage', () {
    final mockedSharedPreferences = MockedSharedPreferences();
    final preferencesService = PreferencesService(mockedSharedPreferences);
    final store = SettingsStore(preferencesService);
    final pageFinder = find.byType(SettingsPage);
    final useDarkModeSettingFinder = find.byKey(Keys.useDarkModeSettingKey);
    testWidgets('Dark mode setting starts at off', (WidgetTester tester) async {
      await _pumpWidget(tester, store);

      expect(pageFinder, findsOneWidget);
      expect(useDarkModeSettingFinder, findsOneWidget);
      expect(store.useDarkMode, false);
    });

    testWidgets('Turn dark mode on', (WidgetTester tester) async {
      await _pumpWidget(tester, store);

      await tester.tap(useDarkModeSettingFinder);
      await tester.pumpAndSettle();
      expect(store.useDarkMode, true);
    });
  });
}

Future<void> _pumpWidget(WidgetTester tester, SettingsStore store) async {
  await tester.pumpWidget(
    Provider<SettingsStore>(
      create: (_) => store,
      child: MaterialApp(
        home: Scaffold(
          body: Consumer<SettingsStore>(
              builder: (_, store, __) => SettingsPage(store)),
        ),
      ),
    ),
  );
}
