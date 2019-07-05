import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../constants/keys.dart';
import '../stores/notifications_store.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsStore>(
      builder: (context, store, _) {
        return Observer(
          builder: (context) {
            return Center(
              child: Text(
                'You have pushed the button on this page ${store.counter} time(s)',
                key: Keys.notificationsPageCounterKey,
              ),
            );
          },
        );
      },
    );
  }
}
