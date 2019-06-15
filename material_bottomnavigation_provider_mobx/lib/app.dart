import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'constants/enums.dart';
import 'stores/app_store.dart';
import 'stores/home_store.dart';
import 'stores/dashboard_store.dart';
import 'stores/notifications_store.dart';
import 'page_container.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>(
          builder: (_) => AppStore(),
        ),
        Provider<HomeStore>(
          builder: (_) => HomeStore(),
        ),
        Provider<DashboardStore>(
          builder: (_) => DashboardStore(),
        ),
        Provider<NotificationsStore>(
          builder: (_) => NotificationsStore(),
        ),
      ],
      child: Consumer<AppStore>(
        builder: (context, store, _) {
          return MaterialApp(
            title: 'Your app title',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Observer(
              builder: (_) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Your app bar title'),
                  ),
                  body: SafeArea(
                    child: PageContainer(
                      store.selectedBottomNavigationMenuOption,
                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    key: Key('bottomNavigationBar'),
                    currentIndex: store.selectedBottomNavigationMenuIndex,
                    items: store.bottomNavigationMenuOptions.map(
                      (option) {
                        switch (option) {
                          case BottomNavigationDestination.Home:
                            return BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              title: Text('Home'),
                            );
                          case BottomNavigationDestination.Dashboard:
                            return BottomNavigationBarItem(
                              icon: Icon(Icons.dashboard),
                              title: Text('Dashboard'),
                            );
                          case BottomNavigationDestination.Notifications:
                            return BottomNavigationBarItem(
                              icon: Icon(Icons.notifications),
                              title: Text('Notifications'),
                            );
                        }
                      },
                    ).toList(),
                    onTap: (index) =>
                        store.selectBottomNavigationMenuOption(index),
                  ),
                  floatingActionButton: FloatingActionButton(
                    key: Key('incrementButton'),
                    onPressed: () {
                      switch (store.selectedBottomNavigationMenuOption) {
                        case BottomNavigationDestination.Home:
                          Provider.of<HomeStore>(context).increment();
                          break;
                        case BottomNavigationDestination.Dashboard:
                          Provider.of<DashboardStore>(context).increment();
                          break;
                        case BottomNavigationDestination.Notifications:
                          Provider.of<NotificationsStore>(context).increment();
                          break;
                      }
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
