import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final authCubit = context.watch<AuthCubit>();
    return NavigationDrawer(
        backgroundColor: colorScheme.surface,
        selectedIndex: null,
        onDestinationSelected: (int index) {
          setState(() {
            navDrawerIndex = index;
          });
          widget.scaffoldKey.currentState?.closeDrawer();
          authCubit.logout();
          context.go(WelcomePage.path);
        },
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, top: 20),
            child: Text("Menú", style: textTheme.headlineSmall),
          ),
          NavigationDrawerDestination(
            icon: Icon(
              Icons.logout_outlined,
              color: colorScheme.error,
            ),
            label: Text(
              "Cerrar sesión",
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.error),
            ),
          ),
        ]);
  }
}
