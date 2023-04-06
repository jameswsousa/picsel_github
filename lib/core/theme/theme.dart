import 'package:flutter/material.dart';
import 'colors.dart';

final theme = ThemeData(
  fontFamily: 'Quicksand',
  textTheme: TextTheme(),
  primaryColor: AppColors.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  colorScheme: ColorScheme(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.primary,
      background: Colors.white,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSurface: AppColors.secondary,
      onBackground: Colors.white,
      onError: AppColors.error,
      brightness: Brightness.light,
      onSecondary: AppColors.primary),
);
