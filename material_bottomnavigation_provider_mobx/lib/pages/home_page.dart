import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../constants/keys.dart';
import '../stores/home_store.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.store, {Key key}) : super(key: key);

  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Center(
          child: Text(
            'You have pushed the button on this page ${store.counter} time(s)',
            key: Keys.homePageCounterKey,
          ),
        );
      },
    );
  }
}
