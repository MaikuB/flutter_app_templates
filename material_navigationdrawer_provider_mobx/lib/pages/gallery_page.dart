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
        return Observer(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gallery',
                    key: Keys.galleryPageTitleKey,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    'You have pushed the button on this page ${store.counter} time(s)',
                    key: Keys.galleryPageCounterKey,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
