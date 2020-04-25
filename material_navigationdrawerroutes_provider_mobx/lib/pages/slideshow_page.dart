import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../constants/keys.dart';
import '../stores/slideshow_store.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage(this.store, {Key key}) : super(key: key);

  final SlideshowStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Slideshow',
          key: Keys.slideshowPageTitleKey,
        ),
      ),
      body: Observer(
        builder: (context) {
          return Center(
            child: Text(
              'You have pushed the button on this page ${store.counter} time(s)',
              key: Keys.slideshowPageCounterKey,
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
