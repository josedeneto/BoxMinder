import 'package:appchat_with_gemini/app/core/ui/style/app_typography.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: AppTypography.i.fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: AppTypography.i.medium.copyWith(color: AppColors.i.hintTextField,fontSize: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Color(0XFF343434),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Color(0XFF343434),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Color(0XFF343434),
        ),
      ),
    ),
  );
}
