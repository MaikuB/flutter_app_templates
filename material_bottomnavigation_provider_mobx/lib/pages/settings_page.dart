import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../constants/keys.dart';
import '../stores/settings_store.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage(this.store, {Key key}) : super(key: key);

  final SettingsStore store;

  @override
  Widget build(BuildContext context) {
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
  }
}
