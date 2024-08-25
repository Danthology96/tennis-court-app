import 'package:flutter/material.dart';
import 'package:tennis_court_app/config/theme/app_colors.dart';

final appColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.secondaryColor,
).copyWith(
  primary: AppColors.primaryColor,
  secondary: AppColors.secondaryColor,
  tertiary: AppColors.tertiaryColor,
  surface: AppColors.primaryColor,
  onSurface: AppColors.textColor,
  onPrimary: AppColors.textColor,
  onSecondary: AppColors.primaryColor,
  error: AppColors.errorColor,

  /// used on images, black backgrounds, etc
  onInverseSurface: AppColors.primaryColor,

  /// used for gray text color
  onSurfaceVariant: AppColors.grayTextColor,
  surfaceContainer: AppColors.containerColor,
);
