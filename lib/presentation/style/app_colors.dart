import 'package:flutter/material.dart';

// Tool for color names -> https://colors.artyclick.com/color-name-finder/

class AppColors {
  AppColors._();
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color mainGreen = Color(0xFF38D431);
  static const Color mainYellow = Color(0xFFF5CD00);
  static const Color mainText = Color(0xFF222222);
  static Color shadow = const Color(0xFFE0CDBA).withOpacity(0.77);
  static const Color background = Color(0xFFFFF7EF);
  static const Color _sunsetOrange = Color(0xFFFF5252);
  static const Color quizAnswerGray = Color(0xFFE8E8E8);
  static const Color wrongAnswerMain = Color(0xFFFF0000);
  static const Color wrongAnswerBackground = Color(0xFFFF9293);
  static const Color inputBorder = Color(0xFFBABABA);

  static const Color requirementRed = _sunsetOrange;

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
