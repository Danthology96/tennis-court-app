import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Bottom Navigation bar implemented in the application
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.navigationShell});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        // selectedItemColor: colorScheme.primary,
        // unselectedItemColor: AppHexColors.gray2,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: (int index) => _onTap(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Más"),
        ]);
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
