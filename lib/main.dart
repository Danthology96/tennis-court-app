import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/config/theme/app_theme.dart';

import 'config/router/app_router.dart';
import 'features/auth/auth.dart';
import 'features/shared/services/secure_storage_key_value_storage_service_impl.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthCubit(
        authRepository: AuthDBRepositoryImpl(),
        secureStorageService: SecureStorageKeyValueStorageServiceImpl(),
      ),
    ),
  ], child: const MyApp()));
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
      builder: BotToastInit(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
