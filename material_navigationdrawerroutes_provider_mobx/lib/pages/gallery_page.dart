import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../constants/keys.dart';
import '../stores/gallery_store.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage(this.store, {Key key}) : super(key: key);

  final GalleryStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery', key: Keys.galleryPageTitleKey),
      ),
      body: Observer(
        builder: (context) {
          return Center(
            child: Text(
              'You have pushed the button on this page ${store.counter} time(s)',
              key: Keys.galleryPageCounterKey,
            ),
          );
        },
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
