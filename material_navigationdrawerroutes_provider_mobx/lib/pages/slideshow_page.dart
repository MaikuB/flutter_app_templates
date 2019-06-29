import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../constants/keys.dart';
import '../stores/slideshow_store.dart';

class SlideshowPage extends StatelessWidget {
  SlideshowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SlideshowStore>(
      builder: (context, store, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Slideshow',
              key: Keys.slideshowPageTitleKey,
            ),
          ),
          body: SafeArea(
            child: Observer(
              builder: (context) {
                return Center(
                  child: Text(
                    'You have pushed the button on this page ${store.counter} time(s)',
                    key: Keys.slideshowPageCounterKey,
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
