import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../constants/keys.dart';
import '../stores/gallery_store.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryStore>(
      builder: (context, store, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Gallery', key: Keys.galleryPageTitleKey),
          ),
          body: SafeArea(
            child: Observer(
              builder: (context) {
                return Center(
                  child: Text(
                    'You have pushed the button on this page ${store.counter} time(s)',
                    key: Keys.galleryPageCounterKey,
                  ),
                );
              },
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
