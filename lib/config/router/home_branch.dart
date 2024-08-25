import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

/// Home branch
final StatefulShellBranch homeBranch = StatefulShellBranch(
  initialLocation: HomePage.path,
  routes: <RouteBase>[
    GoRoute(
      path: HomePage.path,
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),
    // GoRoute(
    //   path: HomeView.path,
    //   name: HomeView.name,
    //   builder: (context, state) => const HomeView(),
    //   redirect: (context, state) {
    //     final authCubit = context.read<AuthCubit>();
    //     final authStatus = authCubit.state.authStatus;

    //     if (authStatus == AuthStatus.restaurantRegistered) {
    //       return null;
    //     }

    //     if (authStatus == AuthStatus.restaurantNotRegistered ||
    //         authCubit.state.user?.restaurant == null) {
    //       return RestaurantFormScreen.path;
    //     }
    //     return null;
    //   },
    // ),
  ],
);
