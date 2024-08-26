import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/reserve/presentation/screens/favorites_page.dart';
import 'package:tennis_court_app/features/reserve/presentation/screens/reserves_page.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

/// Home branch
final List<StatefulShellBranch> mainBranch = [
  StatefulShellBranch(
    initialLocation: HomePage.path,
    routes: <RouteBase>[
      GoRoute(
        path: HomePage.path,
        name: HomePage.name,
        builder: (context, state) => const HomePage(),
      ),
    ],
  ),
  StatefulShellBranch(
    initialLocation: ReservesPage.path,
    routes: <RouteBase>[
      GoRoute(
        path: ReservesPage.path,
        name: ReservesPage.name,
        builder: (context, state) => const ReservesPage(),
      ),
    ],
  ),
  StatefulShellBranch(
    initialLocation: FavoritesPage.path,
    routes: <RouteBase>[
      GoRoute(
        path: FavoritesPage.path,
        name: FavoritesPage.name,
        builder: (context, state) => const FavoritesPage(),
      ),
    ],
  ),
];
