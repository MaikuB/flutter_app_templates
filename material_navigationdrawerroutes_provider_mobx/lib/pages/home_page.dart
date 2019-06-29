import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../constants/routes.dart';
import '../constants/keys.dart';
import '../stores/home_store.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeStore>(
      builder: (context, store, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Home',
              key: Keys.homePageTitleKey,
            ),
          ),
          body: SafeArea(
            child: Observer(
              builder: (context) {
                return Center(
                  child: Text(
                    'You have pushed the button on this page ${store.counter} time(s)',
                    key: Keys.homePageCounterKey,
                  ),
                );
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
                    await Navigator.pushNamed(context, Routes.gallery);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  key: Keys.slideshowDrawerItemKey,
                  leading: Icon(Icons.slideshow),
                  title: Text('Slideshow'),
                  onTap: () async {
                    await Navigator.pushNamed(context, Routes.slideshow);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            key: Keys.incrementButtonKey,
            child: Icon(Icons.add),
            onPressed: () {
              store.increment();
            },
          ),
        );
      },
    );
  }
}
