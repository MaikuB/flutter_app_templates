import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../constants/keys.dart';
import '../stores/settings_store.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsStore>(
      builder: (context, store, _) {
        return Observer(
          builder: (context) {
            return SwitchListTile(
              key: Keys.useDarkModeSettingKey,
              value: store.useDarkMode,
              title: const Text('Use dark mode'),
              onChanged: (value) {
                store.setDarkMode(value);
              },
            );
          },
        );
      },
    );
  }
}
