import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/config/theme/app_theme.dart';

import 'config/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Instanciating the approuter outside of the main build, it will not
  /// rebuild and call the initial path every time
  static final AppRouter appRouter = AppRouter();
  static GoRouter router = appRouter.router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tennis Court App',
      theme: AppTheme().getTheme(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
