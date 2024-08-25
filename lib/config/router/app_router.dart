import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/config/router/home_branch.dart';
import 'package:tennis_court_app/features/auth/auth.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

/// Global key for the Go router parent, needs to have a key to access outside
/// of the shell
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    initialLocation: WelcomeScreen.path,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
          path: WelcomeScreen.path,
          builder: (context, state) {
            return const WelcomeScreen();
          }),
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: SplashScreen.path,
      //   name: SplashScreen.name,
      //   builder: (context, state) => const SplashScreen(),
      //   redirect: (context, state) {
      //     final authCubit = context.read<AuthCubit>();
      //     final authStatus = authCubit.state.authStatus;
      //     if (authStatus == AuthStatus.notRegistered) {
      //       return UserRegisterScreen.path;
      //     }
      //     if (authStatus == AuthStatus.notAuthenticated) {
      //       return LoginScreen.path;
      //     }
      //     if (authStatus == AuthStatus.restaurantNotRegistered) {
      //       return RestaurantFormScreen.path;
      //     }
      //     if (authStatus == AuthStatus.restaurantRegistered) {
      //       return HomeView.path;
      //     }
      //     return null;
      //   },
      // ),

      /// User login Screen
      // GoRoute(
      //   parentNavigatorKey: _rootNavigatorKey,
      //   path: LoginScreen.path,
      //   name: LoginScreen.name,
      //   pageBuilder: (context, state) => buildPageWithDefaultTransition(
      //       context: context, state: state, child: const LoginScreen()),
      //   redirect: (context, state) {
      //     final authCubit = context.read<AuthCubit>();
      //     final authStatus = authCubit.state.authStatus;

      //     if (authStatus == AuthStatus.restaurantNotRegistered) {
      //       return RestaurantFormScreen.path;
      //     }
      //     return null;
      //   },
      // ),

      /// User Registration
      // GoRoute(
      //     parentNavigatorKey: _rootNavigatorKey,
      //     path: UserRegisterScreen.path,
      //     name: UserRegisterScreen.name,
      //     pageBuilder: (context, state) => buildPageWithDefaultTransition(
      //         context: context,
      //         state: state,
      //         child: const UserRegisterScreen())),

      /// StatefullShellRoute used to preserve the state of the routes included
      /// in the bottomnavigationbar tabs, each tab will have it's own routes
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          // Return the widget that implements the custom shell (in this case
          // using a BottomNavigationBar). The StatefulNavigationShell is passed
          // to be able access the state of the shell and to navigate to other
          // branches in a stateful way.

          return MainScreen(navigationShell: navigationShell);
        },
        branches: [homeBranch],
      ),
    ],
  );
}
