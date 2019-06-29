import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'constants/enums.dart';
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
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new AppScaffold(),
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
              key: GlobalKey<ScaffoldState>(),
              appBar: AppBar(
                title: Text('App title'),
              ),
              body: SafeArea(
                child: PageContainer(store.selectedDestination),
              ),
              drawer: Drawer(
                key: Key('drawer'),
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
                    ...DestinationsStoreBase.destinations.map((d) {
                      Key key;
                      Icon icon;
                      Text title;

                      switch (d) {
                        case Destination.Home:
                          key = Key('homeMenuItem');
                          icon = Icon(Icons.home);
                          title = Text('Home');
                          break;
                        case Destination.Gallery:
                          key = Key('galleryMenuItem');
                          icon = Icon(Icons.photo_library);
                          title = Text('Gallery');
                          break;
                        case Destination.Slideshow:
                          key = Key('slideshowMenuItem');
                          icon = Icon(Icons.slideshow);
                          title = Text('Slideshow');
                          break;
                      }
                      return ListTile(
                        key: key,
                        leading: icon,
                        title: title,
                        selected: store.selectedDestination == d,
                        onTap: () {
                          store.selectDestination(d);
                          Navigator.pop(context);
                        },
                      );
                    })
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
        return GalleryPage(key: Key('galleryPage'));
      case Destination.Slideshow:
        return SlideshowPage(key: Key('slideshowPage'));
      default:
        return HomePage(key: Key('homePage'));
    }
  }
}
