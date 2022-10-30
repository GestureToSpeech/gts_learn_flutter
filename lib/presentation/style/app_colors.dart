import 'package:flutter/material.dart';

// Tool for color names -> https://colors.artyclick.com/color-name-finder/

class AppColors {
  AppColors._();
  static const Color _black = Color(0xFF000000);
  static const Color _yellowGreen = Color(0xFF36CE2F);
  static const Color mainGreen = Color(0xFF38D431);
  static const Color mainYellow = Color(0xFFF5CD00);
  static const Color mainText = Color(0xFF222222);
  static Color shadow = const Color(0xFFE0CDBA).withOpacity(0.77);
  static const Color background = Color(0xFFFFF7EF);
  static const Color _treeGreen = Color(0xFF277E24);
  static const Color _sunsetOrange = Color(0xFFFF5252);
  static const Color white = Color(0xFFFFFFFF);
  static const Color _lightGray = Color(0xFFEAEAEA);
  static const Color _platinumGray = Color(0xFFE3E3E3);
  static const Color _backgroundGray = Color(0xFFE8E8E8);
  static const Color _gray = Color(0xFFB2B2B2);
  static const Color quizAnswerGray = Color(0xFFE8E8E8);
  static const Color _darkGray = Color(0xFF909090);
  static const Color _davyGray = Color(0xFF535353);
  static const Color _rubyRed = Color(0xFFED2323);
  static const Color wrongAnswerMain = Color(0xFFFF0000);
  static const Color wrongAnswerBackground = Color(0xFFFF9293);
  static const Color inputBorder = Color(0xFFBABABA);

  static const Color splashScreenBackground = _yellowGreen;
  static const Color splashScreenEllipsis = _treeGreen;
  static const Color textGreen = _yellowGreen;
  static const Color buttonEnabled = _yellowGreen;
  static const Color buttonDisabled = _gray;
  static const Color formBorder = _lightGray;
  static const Color requirementRed = _sunsetOrange;
  static const Color requirementGreen = _yellowGreen;
  static const Color progressBarGreen = _yellowGreen;
  static const Color progressBarGray = _lightGray;
  static const Color lessonArrow = _platinumGray;
  static const Color bottomSheet = _backgroundGray;
  static const Color divider = _lightGray;
  static const Color accuracyHigh = _yellowGreen;
  static const Color accuracyLow = _rubyRed;
  static const Color disabledButtonText = _darkGray;
  static const Color quizSummaryCircleText = _davyGray;
  static const Color foregroundNotificationText = _black;

  static Color lighten(Color c, [int percent = 10]) {
    assert(0 <= percent && percent <= 100, '');
    final p = percent / 100;
    return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round(),
    );
  }
}
