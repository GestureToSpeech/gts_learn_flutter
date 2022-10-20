import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
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
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.mainText,
      elevation: 0,
      titleTextStyle: appTextTheme().overline,
      toolbarTextStyle: appTextTheme().overline,
    ),
    scaffoldBackgroundColor: AppColors.background,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.mainText),
      ),
    ),
    iconTheme: const IconThemeData(
      size: AppDimens.iconSize,
    ),
    dividerColor: AppColors.mainText.withOpacity(0.2),
    dividerTheme: const DividerThemeData(
      indent: AppDimens.d16,
      endIndent: AppDimens.d16,
    ),
  );
}
