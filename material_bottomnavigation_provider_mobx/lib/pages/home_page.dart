import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../constants/keys.dart';
import '../stores/home_store.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeStore>(builder: (context, store, _) {
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
    });
  }
}
