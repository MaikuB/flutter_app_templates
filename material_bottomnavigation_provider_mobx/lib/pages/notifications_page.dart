import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/notifications_store.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsStore>(
      builder: (context, store, _) {
        return Observer(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Notifications',
                    key: Key('notificationsPageTitle'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    'You have pushed the button on this page ${store.counter} time(s)',
                    key: Key('notificationsPageCounter'),
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
