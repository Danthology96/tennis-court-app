import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/config/config.dart';
import 'package:tennis_court_app/config/theme/app_theme.dart';
import 'package:tennis_court_app/features/reserve/infrastructure/repositories/court_repository_impl.dart';

import 'config/router/app_router.dart';
import 'features/auth/auth.dart';
import 'features/shared/services/secure_storage_key_value_storage_service_impl.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await initApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AuthCubit(
        authRepository: AuthDBRepositoryImpl(),
        secureStorageService: SecureStorageKeyValueStorageServiceImpl(),
      ),
    ),
  ], child: const MyApp()));
}

/// Method to write the DB in case of first time using the app
Future<void> initApp() async {
  /// Check if the courts are already in the DB
  final courts = await CourtRepositoryImpl().getCourts();

  /// If the courts are already in the DB, it will not write them again
  if (courts != null && courts.isNotEmpty) return;

  /// If the courts are not in the DB, it will write them
  await CourtRepositoryImpl()
      .registerAllCourts(defaultCourts.map((e) => e.toMap()).toList());
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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es'), // Spanish, Spain
      ],
      locale: const Locale('zh'),
    );
  }
}
