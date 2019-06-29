import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'constants/enums.dart';
import 'constants/keys.dart';
import 'stores/destinations_store.dart';
import 'stores/home_store.dart';
import 'stores/gallery_store.dart';
import 'stores/slideshow_store.dart';
import 'pages/home_page.dart';
import 'pages/gallery_page.dart';
import 'pages/slideshow_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
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
      ],
      child: MaterialApp(
        title: 'App title',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AppScaffold(),
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
                title: Text('App title'),
              ),
              body: SafeArea(
                child: PageContainer(store.selectedDestination),
              ),
              drawer: Drawer(
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
                      onTap: () {
                        Navigator.pop(context);
                        store.selectDestination(Destination.Home);
                      },
                    ),
                    ListTile(
                      key: Keys.galleryDrawerItemKey,
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () async {
                        Navigator.pop(context);
                        store.selectDestination(Destination.Gallery);
                      },
                    ),
                    ListTile(
                      key: Keys.slideshowDrawerItemKey,
                      leading: Icon(Icons.slideshow),
                      title: Text('Slideshow'),
                      onTap: () async {
                        Navigator.pop(context);
                        store.selectDestination(Destination.Slideshow);
                      },
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
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
      default:
        return HomePage(key: Keys.homePageKey);
    }
  }
}
