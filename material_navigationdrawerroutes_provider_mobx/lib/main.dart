import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_navigationdrawerroutes_provider_mobx/pages/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/keys.dart';
import 'constants/routes.dart';
import 'pages/gallery_page.dart';
import 'pages/home_page.dart';
import 'pages/slideshow_page.dart';
import 'services/preferences_service.dart';
import 'stores/gallery_store.dart';
import 'stores/home_store.dart';
import 'stores/settings_store.dart';
import 'stores/slideshow_store.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(App(sharedPreferences));
}

class App extends StatelessWidget {
  const App(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeStore>(
          builder: (_) => HomeStore(),
        ),
        Provider<GalleryStore>(
          builder: (_) => GalleryStore(),
        ),
        Provider<SlideshowStore>(
          builder: (_) => SlideshowStore(),
        ),
        Provider<PreferencesService>(
          builder: (_) => PreferencesService(sharedPreferences),
        ),
        ProxyProvider<PreferencesService, SettingsStore>(
          builder: (_, preferencesService, ___) =>
              SettingsStore(preferencesService),
        )
      ],
      child: Consumer<SettingsStore>(
        builder: (context, store, _) {
          return Observer(
            builder: (_) {
              return MaterialApp(
                title: 'App title',
                theme: store.useDarkMode ? ThemeData.dark() : ThemeData.light(),
                initialRoute: Routes.home,
                routes: {
                  Routes.home: (context) =>
                      const HomePage(key: Keys.homePageKey),
                  Routes.gallery: (context) =>
                      const GalleryPage(key: Keys.galleryPageKey),
                  Routes.slideshow: (context) =>
                      const SlideshowPage(key: Keys.slideshowPageKey),
                  Routes.settings: (context) =>
                      const SettingsPage(key: Keys.settingsPageKey),
                },
              );
            },
          );
        },
      ),
    );
  }
}
