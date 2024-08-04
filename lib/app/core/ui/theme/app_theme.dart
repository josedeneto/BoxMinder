import 'package:appchat_with_gemini/app/core/ui/style/app_style.dart';
import 'package:appchat_with_gemini/app/core/ui/style/app_typography.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: AppTypography.i.fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: AppTypography.i.medium.copyWith(color: AppColors.i.secondaryHintColor,fontSize: 15),
      border: AppStyle.i.defaulTextFieldBorder.copyWith(borderRadius: BorderRadius.circular(50)) /*OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
         // color: Color(0XFF343434),
        ),
      )*/,
      focusedBorder:  AppStyle.i.defaulTextFieldBorder.copyWith(borderRadius: BorderRadius.circular(50)),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      enabledBorder:  AppStyle.i.defaulTextFieldBorder.copyWith(borderRadius: BorderRadius.circular(50)),
    ),
  );
}
