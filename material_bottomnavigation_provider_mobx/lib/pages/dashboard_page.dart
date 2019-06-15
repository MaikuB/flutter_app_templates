import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/dashboard_store.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardStore>(
      builder: (context, store, _) {
        return Observer(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dashboard',
                    key: Key('dashboardPageTitle'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    'You have pushed the button on this page ${store.counter} time(s)',
                    key: Key('dashboardPageCounter'),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
