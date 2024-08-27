import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/auth/auth.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (int index) {
          setState(() {
            navDrawerIndex = index;
          });
          widget.scaffoldKey.currentState?.closeDrawer();
          context.go(WelcomePage.path);
        },
        children: const [
          NavigationDrawerDestination(
            icon: Icon(Icons.logout_outlined),
            label: Text("Cerrar sesión"),
          ),
        ]);
  }
}
