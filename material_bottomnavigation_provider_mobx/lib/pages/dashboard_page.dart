import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../constants/keys.dart';
import '../stores/dashboard_store.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardStore>(
      builder: (context, store, _) {
        return Observer(
          builder: (context) {
            return Center(
              child: Text(
                'You have pushed the button on this page ${store.counter} time(s)',
                key: Keys.dashboardPageCounterKey,
              ),
            );
          },
        );
      },
    );
  }
}
