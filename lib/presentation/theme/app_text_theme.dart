import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_text_styles.dart';

TextTheme appTextTheme() => TextTheme(
      headline1: AppTextStyles.bold30,
      headline2: AppTextStyles.regular30,
      headline3: AppTextStyles.bold20,
      headline4: AppTextStyles.regular20,
      headline5: AppTextStyles.bold16,
      headline6: AppTextStyles.regular16,
      bodyText1: AppTextStyles.bold12,
      bodyText2: AppTextStyles.regular12,
      caption: AppTextStyles.regular12,
      button: AppTextStyles.regular12,
      subtitle1: AppTextStyles.bold10,
      subtitle2: AppTextStyles.regular10,
      overline: AppTextStyles.regular8,
    );

extension TabletTextTheme on TextTheme {
  TextStyle get tabletHeadline1 => AppTextStyles.bold50;
  TextStyle get tabletHeadline2 => AppTextStyles.regular50;
  TextStyle get tabletHeadline3 => AppTextStyles.bold40;
  TextStyle get tabletHeadline4 => AppTextStyles.regular40;
  TextStyle get tabletDictEntryRegular => AppTextStyles.regular14;
  TextStyle get tabletDictEntryBold => AppTextStyles.bold14;
}
