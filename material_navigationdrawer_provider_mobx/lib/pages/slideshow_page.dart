import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/slideshow_store.dart';

class SlideshowPage extends StatelessWidget {
  SlideshowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SlideshowStore>(builder: (context, store, _) {
      return Observer(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Slideshow',
                  key: Key('slideshowPageTitle'),
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  'You have pushed the button on this page ${store.counter} time(s)',
                  key: Key('slideshowPageCounter'),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
