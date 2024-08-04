import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppStyle {
  static AppStyle? _instance;
  AppStyle._();

  static AppStyle get i {
    _instance ??= AppStyle._();
    return _instance!;
  }

  ButtonStyle get buttonStyle => ElevatedButton.styleFrom(
        elevation: 1,
        backgroundColor: AppColors.i.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: AppColors.i.primary,
      );

  OutlineInputBorder get  defaulTextFieldBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: AppColors.i.borderSide,
    ),
  );
}
