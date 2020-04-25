import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/enums.dart';
import 'constants/keys.dart';
import 'pages/gallery_page.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';
import 'pages/slideshow_page.dart';
import 'services/preferences_service.dart';
import 'stores/destinations_store.dart';
import 'stores/gallery_store.dart';
import 'stores/home_store.dart';
import 'stores/settings_store.dart';
import 'stores/slideshow_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        Provider<DestinationsStore>(
          create: (_) => DestinationsStore(),
        ),
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
          update: (_, preferencesService, __) =>
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
                home: const AppScaffold(),
              );
            },
          );
        },
      ),
    );
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DestinationsStore>(
      builder: (context, store, _) {
        return Observer(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: AppBarTitle(store.selectedDestination),
              ),
              body: SafeArea(
                child: PageContainer(store.selectedDestination),
              ),
              drawer: AppDrawer(store),
              floatingActionButton: store.selectedDestination ==
                      Destination.Settings
                  ? null
                  : FloatingActionButton(
                      key: const Key('incrementButton'),
                      onPressed: () {
                        switch (store.selectedDestination) {
                          case Destination.Home:
                            Provider.of<HomeStore>(context, listen: false)
                                .increment();
                            break;
                          case Destination.Gallery:
                            Provider.of<GalleryStore>(context, listen: false)
                                .increment();
                            break;
                          case Destination.Slideshow:
                            Provider.of<SlideshowStore>(context, listen: false)
                                .increment();
                            break;
                          default:
                            break;
                        }
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
            );
          },
        );
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle(this.destination, {Key key}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    switch (destination) {
      case Destination.Gallery:
        return const Text('Gallery', key: Keys.galleryPageTitleKey);
      case Destination.Slideshow:
        return const Text('Slideshow', key: Keys.slideshowPageTitleKey);
      case Destination.Settings:
        return const Text('Settings', key: Keys.settingsPageTitleKey);
      default:
        return const Text('Home', key: Keys.homePageTitleKey);
    }
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer(
    this.store, {
    Key key,
  }) : super(key: key);

  final DestinationsStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('User'),
                accountEmail: Text('user@email.com'),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.android),
                ),
              ),
              ListTile(
                key: Keys.homeDrawerItemKey,
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                selected: store.selectedDestination == Destination.Home,
                onTap: () {
                  Navigator.pop(context);
                  store.selectDestination(Destination.Home);
                },
              ),
              ListTile(
                key: Keys.galleryDrawerItemKey,
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                selected: store.selectedDestination == Destination.Gallery,
                onTap: () async {
                  Navigator.pop(context);
                  store.selectDestination(Destination.Gallery);
                },
              ),
              ListTile(
                key: Keys.slideshowDrawerItemKey,
                leading: const Icon(Icons.slideshow),
                title: const Text('Slideshow'),
                selected: store.selectedDestination == Destination.Slideshow,
                onTap: () async {
                  Navigator.pop(context);
                  store.selectDestination(Destination.Slideshow);
                },
              ),
              Divider(),
              ListTile(
                key: Keys.settingsDrawerItemKey,
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                selected: store.selectedDestination == Destination.Settings,
                onTap: () async {
                  Navigator.pop(context);
                  store.selectDestination(Destination.Settings);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class PageContainer extends StatelessWidget {
  const PageContainer(this.destination, {Key key}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    switch (destination) {
      case Destination.Gallery:
        return Consumer<GalleryStore>(
          builder: (_, store, __) =>
              GalleryPage(store, key: Keys.galleryPageKey),
        );
      case Destination.Slideshow:
        return Consumer<SlideshowStore>(
          builder: (_, store, __) =>
              SlideshowPage(store, key: Keys.slideshowPageKey),
        );
      case Destination.Settings:
        return Consumer<SettingsStore>(
          builder: (_, store, __) =>
              SettingsPage(store, key: Keys.settingsPageKey),
        );
      default:
        return Consumer<HomeStore>(
          builder: (_, store, __) => HomePage(store, key: Keys.homePageKey),
        );
    }
  }
}
