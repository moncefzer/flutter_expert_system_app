import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle? get _darkHeadlineSmall =>
      _poppinsTextTheme.headlineSmall?.copyWith(
        fontSize: 24.sp,
        color: AppColors.black,
      );

  static TextStyle? get _darkTitleLarge =>
      _poppinsTextTheme.titleLarge?.copyWith(
        fontSize: 20.sp,
        color: AppColors.black,
      );

  static TextStyle? get _darkTitleMedium => _poppinsTextTheme.titleMedium
      ?.copyWith(fontSize: 16.sp, color: AppColors.black);

  static TextStyle? get _darkBodyMedium =>
      _poppinsTextTheme.bodyMedium?.copyWith(
        fontSize: 14.sp,
        color: AppColors.black,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
      );

  static TextStyle? get _darkLabelLarge =>
      _poppinsTextTheme.labelLarge?.copyWith(
        fontSize: 14.sp,
        color: AppColors.black,
      );

  static getLightTextTheme() => TextTheme(
        headlineSmall: _darkHeadlineSmall,
        titleLarge: _darkTitleLarge,
        titleMedium: _darkTitleMedium,
        bodyMedium: _darkBodyMedium,
        labelLarge: _darkLabelLarge,
      );
}


// displayLarge = displayLarge ?? headline1,
// displayMedium = displayMedium ?? headline2,
// displaySmall = displaySmall ?? headline3,
// headlineMedium = headlineMedium ?? headline4,
// headlineSmall = headlineSmall ?? headline5,
// titleLarge = titleLarge ?? headline6,
// titleMedium = titleMedium ?? subtitle1,
// titleSmall = titleSmall ?? subtitle2,
// bodyLarge = bodyLarge ?? bodyText1,
// bodyMedium = bodyMedium ?? bodyText2,
// bodySmall = bodySmall ?? caption,
// labelLarge = labelLarge ?? button,
// labelSmall = labelSmall ?? overline;