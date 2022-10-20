import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';

@immutable
class AppTheme {
  static final appThemeData = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.background,
        secondary: AppColors.mainGreen,
        background: AppColors.background,
        surface: AppColors.mainText,
      ),
      textTheme: appTextTheme().apply(
        bodyColor: AppColors.mainText,
        displayColor: AppColors.mainText,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.background,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.mainText),
      )));
}
