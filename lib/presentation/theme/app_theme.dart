import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:gts_learn/presentation/style/app_dimens.dart';
import 'package:gts_learn/presentation/theme/app_text_theme.dart';

@immutable
class AppTheme {
  static final appThemeData = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      selectedItemColor: AppColors.mainText,
      selectedLabelStyle: appTextTheme().subtitle1,
      unselectedLabelStyle: appTextTheme().subtitle2,
      selectedIconTheme: const IconThemeData(size: AppDimens.navigatorIconSize),
      unselectedIconTheme:
          const IconThemeData(size: AppDimens.navigatorIconSize),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        minimumSize: MaterialStateProperty.all(
          const Size(330, 60),
        ),
        foregroundColor: MaterialStateProperty.all(AppColors.mainText),
        backgroundColor: MaterialStateProperty.all(AppColors.mainGreen),
        textStyle: MaterialStateProperty.all(appTextTheme().headline5),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.buttonBorderRadius),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.mainText),
        splashFactory: NoSplash.splashFactory,
        textStyle: MaterialStateProperty.all(
          appTextTheme().bodyText1?.copyWith(
                decoration: TextDecoration.underline,
                color: AppColors.mainText,
              ),
        ),
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
