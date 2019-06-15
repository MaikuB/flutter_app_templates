import 'package:flutter/material.dart';
import 'constants/enums.dart';
import 'pages/home_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/notifications_page.dart';

class PageContainer extends StatelessWidget {
  final BottomNavigationMenuOption bottomNavigationMenuOption;

  const PageContainer(this.bottomNavigationMenuOption, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (bottomNavigationMenuOption) {
      case BottomNavigationMenuOption.Home:
        return HomePage(key: Key('homePage'));
      case BottomNavigationMenuOption.Dashboard:
        return DashboardPage(key: Key('dashboardPage'));
      case BottomNavigationMenuOption.Notifications:
        return NotificationsPage(key: Key('notificationsPage'));
    }
    return null;
  }
}
