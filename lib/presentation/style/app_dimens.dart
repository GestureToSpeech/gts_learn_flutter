import 'package:flutter/material.dart';
import 'package:gts_learn/app/utils/size_utils.dart';

class AppDimens {
  AppDimens._();

  static Future<void> init(BuildContext context) async {
    isTablet = await context.isTablet();
    navigatorBorderRadius = 10;
    navigatorIndicatorSize = 10;
    navigatorIndicatorStartingX = isTablet ? 295 : 75;
    navigatorIndicatorBottomOffset = 18;
    navigatorIndicatorSpaceBetween = isTablet ? 110 : 115;
    navigatorHeight = isTablet ? 70 : 70;
    videoPlayerSize = isTablet ? 415 : 195;
  }

  static late bool isTablet;

  static const double d2 = 2;
  static const double d4 = 4;
  static const double d8 = 8;
  static const double d10 = 10;
  static const double d12 = 12;
  static const double d16 = 16;
  static const double d20 = 20;
  static const double d24 = 24;
  static const double d32 = 32;
  static const double d40 = 40;
  static const double d50 = 50;

  static const double iconSize = 30;
  static const double navigatorIconSize = 40;
  static const double navigatorBlurRadius = 14;
  static const double navigatorShadowSpreadRadius = 5;

  static const double borderRadiusMedium = 10;
  static const double borderRadiusSmall = 5;

  static const double iconSizeLarge = 40;

  static late double navigatorBorderRadius;
  static late double navigatorIndicatorSize;
  static late double navigatorIndicatorStartingX;
  static late double navigatorIndicatorBottomOffset;
  static late double navigatorIndicatorSpaceBetween;
  static late double navigatorHeight;
  static late double videoPlayerSize;

  static const double videoPlayerButtonSize = 50;

  static const double carouselBorderRadius = 10;
  static const double carouselArrowWidth = 60;
  static const double carouselArrowHeight = 2;
  static const double carouselArrowBorderRadius = 1;
  static const double carouselAspectRatio = 1;
  static const double carouselViewFraction = 0.7;
  static const double carouselHeight = 380;
  static const double carouselBackgroundOffset = 40;
  static const double carouselCounterOffset = 28;
  static const double carouselCounterTextSize = 6;
  static const double carouselDescriptionHeight = 60;

  static const double minQuizAnswerWidth = 100;
  static const double minQuizAnswerHeight = 30;

  static const double appBarHeight = 90;
  static const double appBarMenuTextOffset = 75;
  static const double appBarMenuWidth = 30;

  static const double buttonBorderRadius = 10;
  static const double buttonIconSize = 40;

  static const double quizResultsAnswerPadding = 50;
  static const double quizResultsAnswerBorderRadius = 30;
  static const double quizResultsAnswerIconSize = 20;
  static const double quizResultsAnswerTextWidth = 160;

  static const double lessonDetailsIndicatorSize = 15;
  static const double lessonDetailsIndicatorIconSize = 20;
  static const double lessonDetailsIndicatorBorderWidth = 3;
  static const double lessonDetailsIconSize = 40;

  static const double lessonTileDotSize = 15;
  static const double lessonTileBlurRadius = 10;
  static const double lessonTileDotBorderThickness = 3;
  static const double lessonTileStatusIconSize = 20;
  static const double lessonTileLessonIconSize = 40;
  static const double lessonTileOneLineHeight = 70;
  static const double lessonTileTwoLineHeight = 120;

  static const double startQuizBorderRadius = 10;
  static const double startQuizBlurRadius = 7;
  static const double startQuizSpreadRadius = 2;

  static const double dictionarySearchFieldHeight = 60;

  static const double wordDetailsButtonWidth = 350;
}

class AppSpacers {
  AppSpacers._();

  // height
  static const SizedBox h2 = SizedBox(height: AppDimens.d2);
  static const SizedBox h4 = SizedBox(height: AppDimens.d4);
  static const SizedBox h8 = SizedBox(height: AppDimens.d8);
  static const SizedBox h12 = SizedBox(height: AppDimens.d12);
  static const SizedBox h16 = SizedBox(height: AppDimens.d16);
  static const SizedBox h20 = SizedBox(height: AppDimens.d20);
  static const SizedBox h24 = SizedBox(height: AppDimens.d24);
  static const SizedBox h32 = SizedBox(height: AppDimens.d32);
  static const SizedBox h40 = SizedBox(height: AppDimens.d40);

  // width
  static const SizedBox w2 = SizedBox(width: AppDimens.d2);
  static const SizedBox w4 = SizedBox(width: AppDimens.d4);
  static const SizedBox w8 = SizedBox(width: AppDimens.d8);
  static const SizedBox w12 = SizedBox(width: AppDimens.d12);
  static const SizedBox w16 = SizedBox(width: AppDimens.d16);
  static const SizedBox w20 = SizedBox(width: AppDimens.d20);
  static const SizedBox w24 = SizedBox(width: AppDimens.d24);
  static const SizedBox w32 = SizedBox(width: AppDimens.d32);
  static const SizedBox w40 = SizedBox(width: AppDimens.d40);
}
