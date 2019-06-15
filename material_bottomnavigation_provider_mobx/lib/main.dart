import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'constants/enums.dart';
import 'stores/app_store.dart';
import 'stores/home_store.dart';
import 'stores/dashboard_store.dart';
import 'stores/notifications_store.dart';
import 'pages/home_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/notifications_page.dart';

void main() => runApp(App());

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
                      store.selectedBottomNavigationDestination,
                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    key: Key('bottomNavigationBar'),
                    currentIndex:
                        store.selectedBottomNavigationDestinationIndex,
                    items: AppStoreBase.bottomNavigationDestinations.map(
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
                      switch (store.selectedBottomNavigationDestination) {
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

class PageContainer extends StatelessWidget {
  final BottomNavigationDestination bottomNavigationMenuOption;

  const PageContainer(this.bottomNavigationMenuOption, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (bottomNavigationMenuOption) {
      case BottomNavigationDestination.Home:
        return HomePage(key: Key('homePage'));
      case BottomNavigationDestination.Dashboard:
        return DashboardPage(key: Key('dashboardPage'));
      case BottomNavigationDestination.Notifications:
        return NotificationsPage(key: Key('notificationsPage'));
      default:
        return HomePage(key: Key('homePage'));
    }
  }
}
