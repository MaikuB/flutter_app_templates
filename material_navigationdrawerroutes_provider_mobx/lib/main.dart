import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'constants/keys.dart';
import 'constants/routes.dart';
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
        home: Consumer<DestinationsStore>(
            builder: (context, store, _) => AppScaffold(store)),
      ),
    );
  }
}

class AppScaffold extends StatefulWidget {
  final DestinationsStore store;
  AppScaffold(this.store, {Key key}) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold>
    with SingleTickerProviderStateMixin {
  final _navigatorKey = GlobalKey<NavigatorState>();
  AnimationController _controller;

  ReactionDisposer reactionDispose;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    reactionDispose = reaction<String>((_) => widget.store.selectedDestination,
        (route) async {
      switch (route) {
        case Routes.home:
          if (_navigatorKey.currentState.canPop()) {
            _controller.reverse();
            _navigatorKey.currentState.pop();
          }
          break;
        case Routes.gallery:
        case Routes.slideshow:
          _controller.forward();
          await _navigatorKey.currentState.pushNamed(route);
          break;
      }
    });
  }

  @override
  void dispose() {
    reactionDispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: AnimatedAppBarMenuButton(
          controller: _controller,
        ),
        title: Observer(
          builder: (_) {
            switch (widget.store.selectedDestination) {
              case Routes.home:
                return Text('Home', key: Keys.homePageTitleKey);
              case Routes.gallery:
                return Text('Gallery', key: Keys.galleryPageTitleKey);
              case Routes.slideshow:
                return Text('Slideshow', key: Keys.slideshowPageTitleKey);
            }
          },
        ),
      ),
      body: SafeArea(
        child: Navigator(
          key: _navigatorKey,
          initialRoute: Routes.home,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case Routes.home:
                return MaterialPageRoute(
                    builder: (context) => HomePage(key: Keys.homePageKey));
              case Routes.gallery:
                return MaterialPageRoute(
                    builder: (context) =>
                        GalleryPage(key: Keys.galleryPageKey));
              case Routes.slideshow:
                return MaterialPageRoute(
                    builder: (context) =>
                        SlideshowPage(key: Keys.slideshowPageKey));
            }
          },
        ),
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
              },
            ),
            ListTile(
              key: Keys.galleryDrawerItemKey,
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () async {
                Navigator.pop(context);
                widget.store.selectDestination(Routes.gallery);
              },
            ),
            ListTile(
              key: Keys.slideshowDrawerItemKey,
              leading: Icon(Icons.slideshow),
              title: Text('Slideshow'),
              onTap: () async {
                Navigator.pop(context);
                widget.store.selectDestination(Routes.slideshow);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('incrementButton'),
        onPressed: () {
          switch (widget.store.selectedDestination) {
            case Routes.home:
              Provider.of<HomeStore>(context).increment();
              break;
            case Routes.gallery:
              Provider.of<GalleryStore>(context).increment();
              break;
            case Routes.slideshow:
              Provider.of<SlideshowStore>(context).increment();
              break;
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class AnimatedAppBarMenuButton extends StatelessWidget {
  const AnimatedAppBarMenuButton({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<DestinationsStore>(
      builder: (context, store, _) {
        return Observer(
          builder: (_) => IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                progress: controller,
              ),
              onPressed: () {
                if (store.selectedDestination == Routes.home) {
                  Scaffold.of(context).openDrawer();
                  return;
                }
                store.selectDestination(Routes.home);
              },
              tooltip: store.selectedDestination == Routes.home
                  ? MaterialLocalizations.of(context).openAppDrawerTooltip
                  : MaterialLocalizations.of(context).backButtonTooltip),
        );
      },
    );
  }
}
