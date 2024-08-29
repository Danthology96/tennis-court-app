import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/config/helpers/helpers.dart';
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
    observers: [BotToastNavigatorObserver()],
    initialLocation: WelcomePage.path,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: WelcomePage.path,
        builder: (context, state) {
          return const WelcomePage();
        },
        redirect: (context, state) {
          final authCubit = context.read<AuthCubit>();
          final authStatus = authCubit.state.authStatus;
          if (authStatus == AuthStatus.notRegistered) {
            return RegisterPage.path;
          }
          if (authStatus == AuthStatus.notAuthenticated) {
            return LoginPage.path;
          }

          return null;
        },
      ),

      /// User login Screen
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: LoginPage.path,
        name: LoginPage.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(0.75, 0),
                      end: Offset.zero,
                    ),
                  ),
                  child: child),
        ),
      ),

      /// User Registration
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: RegisterPage.path,
        name: RegisterPage.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RegisterPage(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(0.75, 0),
                      end: Offset.zero,
                    ),
                  ),
                  child: child),
        ),
      ),

      /// Reservation Page
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: ReservationPage.path,
        name: ReservationPage.name,
        builder: (context, state) => ReservationPage(
          court: state.extra as Court,
        ),
      ),

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
        branches: mainBranch,
      ),
    ],
  );
}
