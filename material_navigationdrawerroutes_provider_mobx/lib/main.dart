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
          create: (_) => HomeStore(),
        ),
        Provider<GalleryStore>(
          create: (_) => GalleryStore(),
        ),
        Provider<SlideshowStore>(
          create: (_) => SlideshowStore(),
        ),
        Provider<PreferencesService>(
          create: (_) => PreferencesService(sharedPreferences),
        ),
        ProxyProvider<PreferencesService, SettingsStore>(
          update: (_, preferencesService, ___) =>
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
                  Routes.home: (_) => Consumer<HomeStore>(
                        builder: (_, store, __) =>
                            HomePage(store, key: Keys.homePageKey),
                      ),
                  Routes.gallery: (_) => Consumer<GalleryStore>(
                        builder: (_, store, __) =>
                            GalleryPage(store, key: Keys.galleryPageKey),
                      ),
                  Routes.slideshow: (context) => Consumer<SlideshowStore>(
                        builder: (_, store, __) =>
                            SlideshowPage(store, key: Keys.slideshowPageKey),
                      ),
                  Routes.settings: (context) => Consumer<SettingsStore>(
                        builder: (_, store, __) =>
                            SettingsPage(store, key: Keys.settingsPageKey),
                      ),
                },
              );
            },
          );
        },
      ),
    );
  }
}
