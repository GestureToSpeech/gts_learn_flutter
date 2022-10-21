import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static final _fontRegular = GoogleFonts.lexendExa().copyWith(
    color: AppColors.mainText,
  );
  static final _fontBold = GoogleFonts.lexendExa().copyWith(
    fontWeight: FontWeight.w700,
    color: AppColors.mainText,
  );

  static final regular30 = _fontRegular.copyWith(fontSize: 30);
  static final regular20 = _fontRegular.copyWith(fontSize: 20);
  static final regular16 = _fontRegular.copyWith(fontSize: 16);
  static final regular12 = _fontRegular.copyWith(fontSize: 12);
  static final regular10 = _fontRegular.copyWith(fontSize: 10);
  static final regular8 = _fontRegular.copyWith(fontSize: 8);
  static final bold30 = _fontBold.copyWith(fontSize: 30);
  static final bold20 = _fontBold.copyWith(fontSize: 20);
  static final bold16 = _fontBold.copyWith(fontSize: 16);
  static final bold12 = _fontBold.copyWith(fontSize: 12);
  static final bold10 = _fontBold.copyWith(fontSize: 10);
}
