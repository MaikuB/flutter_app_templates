import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../constants/keys.dart';
import '../constants/routes.dart';
import '../stores/home_store.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.store, {Key key}) : super(key: key);

  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', key: Keys.homePageTitleKey),
      ),
      body: Observer(
        builder: (context) {
          return Center(
            child: Text(
              'You have pushed the button on this page ${store.counter} time(s)',
              key: Keys.homePageCounterKey,
            ),
          );
        },
      ),
      drawer: Drawer(
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
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              key: Keys.galleryDrawerItemKey,
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () async {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.gallery);
              },
            ),
            ListTile(
              key: Keys.slideshowDrawerItemKey,
              leading: const Icon(Icons.slideshow),
              title: const Text('Slideshow'),
              onTap: () async {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.slideshow);
              },
            ),
            Divider(),
            ListTile(
              key: Keys.settingsDrawerItemKey,
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () async {
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.settings);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('incrementButton'),
        onPressed: () {
          store.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
