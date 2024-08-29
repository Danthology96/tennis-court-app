import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

/// Home branch
final List<StatefulShellBranch> mainBranch = [
  StatefulShellBranch(
    initialLocation: HomePage.path,
    routes: <RouteBase>[
      GoRoute(
        path: HomePage.path,
        name: HomePage.name,
        builder: (context, state) => HomePage(),
      ),
    ],
  ),
  StatefulShellBranch(
    initialLocation: ReservationListPage.path,
    routes: <RouteBase>[
      GoRoute(
        path: ReservationListPage.path,
        name: ReservationListPage.name,
        builder: (context, state) => const ReservationListPage(),
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
