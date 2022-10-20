import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_text_styles.dart';

TextTheme appTextTheme() => TextTheme(
      headline1: AppTextStyles.bold30,
      headline2: AppTextStyles.regular30,
      headline3: AppTextStyles.bold20,
      headline4: AppTextStyles.regular20,
      bodyText1: AppTextStyles.bold12,
      bodyText2: AppTextStyles.regular12,
      caption: AppTextStyles.regular12,
      button: AppTextStyles.regular12,
      subtitle1: AppTextStyles.bold12,
      subtitle2: AppTextStyles.regular12,
      overline: AppTextStyles.regular8,
    );
