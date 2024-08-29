import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Bottom Navigation bar implemented in the application
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.navigationShell});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            fixedColor: colorScheme.surface,
            backgroundColor: colorScheme.surface,
            type: BottomNavigationBarType.fixed,
            elevation: 10,
            onTap: (int index) => _onTap(context, index),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              _buildBottomNavigationBarItem(
                  Icons.home_filled, "Inicio", 0, colorScheme),
              _buildBottomNavigationBarItem(
                  Icons.calendar_today_outlined, "Reservas", 1, colorScheme),
              _buildBottomNavigationBarItem(
                  Icons.favorite_border_outlined, "Favoritos", 2, colorScheme),
            ]),
      ),
    );
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

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index, ColorScheme colorScheme) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: BoxDecoration(
          color: navigationShell.currentIndex == index
              ? colorScheme.surfaceContainer
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: navigationShell.currentIndex == index
                  ? colorScheme.surface
                  : colorScheme.onSurface,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: navigationShell.currentIndex == index
                    ? colorScheme.surface
                    : colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}
