import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/enums.dart';
import 'constants/keys.dart';
import 'services/preferences_service.dart';
import 'stores/destinations_store.dart';
import 'stores/home_store.dart';
import 'stores/gallery_store.dart';
import 'stores/slideshow_store.dart';
import 'stores/settings_store.dart';
import 'pages/home_page.dart';
import 'pages/gallery_page.dart';
import 'pages/slideshow_page.dart';
import 'pages/settings_page.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(App(sharedPreferences));
}

class App extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  App(this.sharedPreferences);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DestinationsStore>(
          builder: (_) => DestinationsStore(),
        ),
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
          builder: (_, preferencesService, __) =>
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
                home: AppScaffold(),
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
                      key: Key('incrementButton'),
                      onPressed: () {
                        switch (store.selectedDestination) {
                          case Destination.Home:
                            Provider.of<HomeStore>(context).increment();
                            break;
                          case Destination.Gallery:
                            Provider.of<GalleryStore>(context).increment();
                            break;
                          case Destination.Slideshow:
                            Provider.of<SlideshowStore>(context).increment();
                            break;
                          default:
                            break;
                        }
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
            );
          },
        );
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  final Destination destination;
  const AppBarTitle(this.destination, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (destination) {
      case Destination.Gallery:
        return Text('Gallery', key: Keys.galleryPageTitleKey);
      case Destination.Slideshow:
        return Text('Slideshow', key: Keys.slideshowPageTitleKey);
      case Destination.Settings:
        return Text('Settings', key: Keys.settingsPageTitleKey);
      default:
        return Text('Home', key: Keys.homePageTitleKey);
    }
  }
}

class AppDrawer extends StatelessWidget {
  final DestinationsStore store;
  AppDrawer(
    this.store, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('User'),
                accountEmail: Text('user@email.com'),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.android),
                ),
              ),
              ListTile(
                key: Keys.homeDrawerItemKey,
                leading: Icon(Icons.home),
                title: Text('Home'),
                selected: store.selectedDestination == Destination.Home,
                onTap: () {
                  Navigator.pop(context);
                  store.selectDestination(Destination.Home);
                },
              ),
              ListTile(
                key: Keys.galleryDrawerItemKey,
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                selected: store.selectedDestination == Destination.Gallery,
                onTap: () async {
                  Navigator.pop(context);
                  store.selectDestination(Destination.Gallery);
                },
              ),
              ListTile(
                key: Keys.slideshowDrawerItemKey,
                leading: Icon(Icons.slideshow),
                title: Text('Slideshow'),
                selected: store.selectedDestination == Destination.Slideshow,
                onTap: () async {
                  Navigator.pop(context);
                  store.selectDestination(Destination.Slideshow);
                },
              ),
              Divider(),
              ListTile(
                key: Keys.settingsDrawerItemKey,
                leading: Icon(Icons.settings),
                title: Text('Settings'),
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
  final Destination destination;
  const PageContainer(this.destination, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (destination) {
      case Destination.Gallery:
        return GalleryPage(key: Keys.galleryPageKey);
      case Destination.Slideshow:
        return SlideshowPage(key: Keys.slideshowPageKey);
      case Destination.Settings:
        return SettingsPage(key: Keys.settingsPageKey);
      default:
        return HomePage(key: Keys.homePageKey);
    }
  }
}
