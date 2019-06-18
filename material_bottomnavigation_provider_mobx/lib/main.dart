import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'constants/enums.dart';
import 'stores/destinations_store.dart';
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
        Provider<DestinationsStore>(
          builder: (_) => DestinationsStore(),
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
      child: Consumer<DestinationsStore>(
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
                      store.selectedDestination,
                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    key: Key('bottomNavigationBar'),
                    currentIndex: store.selectedDestinationIndex,
                    items:
                        DestinationsStoreBase.bottomNavigationDestinations.map(
                      (option) {
                        switch (option) {
                          case Destination.Home:
                            return BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              title: Text('Home'),
                            );
                          case Destination.Dashboard:
                            return BottomNavigationBarItem(
                              icon: Icon(Icons.dashboard),
                              title: Text('Dashboard'),
                            );
                          case Destination.Notifications:
                            return BottomNavigationBarItem(
                              icon: Icon(Icons.notifications),
                              title: Text('Notifications'),
                            );
                        }
                      },
                    ).toList(),
                    onTap: (index) => store.selectDestination(index),
                  ),
                  floatingActionButton: FloatingActionButton(
                    key: Key('incrementButton'),
                    onPressed: () {
                      switch (store.selectedDestination) {
                        case Destination.Home:
                          Provider.of<HomeStore>(context).increment();
                          break;
                        case Destination.Dashboard:
                          Provider.of<DashboardStore>(context).increment();
                          break;
                        case Destination.Notifications:
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
  final Destination bottomNavigationMenuOption;

  const PageContainer(this.bottomNavigationMenuOption, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (bottomNavigationMenuOption) {
      case Destination.Home:
        return HomePage(key: Key('homePage'));
      case Destination.Dashboard:
        return DashboardPage(key: Key('dashboardPage'));
      case Destination.Notifications:
        return NotificationsPage(key: Key('notificationsPage'));
      default:
        return HomePage(key: Key('homePage'));
    }
  }
}
