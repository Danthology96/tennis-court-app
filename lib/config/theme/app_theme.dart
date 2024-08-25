import 'package:flutter/material.dart';
import 'package:tennis_court_app/config/theme/app_color_scheme.dart';
import 'package:tennis_court_app/config/theme/app_colors.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        fontFamily: "Poppins",
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.primaryColor,
        colorScheme: appColorScheme,
        appBarTheme: const AppBarTheme(centerTitle: false),
      );
}
