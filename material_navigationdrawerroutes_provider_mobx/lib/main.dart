import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/keys.dart';
import 'constants/routes.dart';
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
          initialRoute: Routes.home,
          routes: {
            Routes.home: (context) => HomePage(key: Keys.homePageKey),
            Routes.gallery: (context) => GalleryPage(key: Keys.galleryPageKey),
            Routes.slideshow: (context) =>
                SlideshowPage(key: Keys.slideshowPageKey),
          }),
    );
  }
}
