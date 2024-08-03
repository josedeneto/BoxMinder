
import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static AppTypography? _instance;
  AppTypography._();


  static AppTypography get i {
    _instance??= AppTypography._();
    return _instance!;
  }

  String fontFamily = 'Manrope';
  TextStyle get light =>  TextStyle(fontWeight: FontWeight.w300, color: AppColors.i.text);
  TextStyle get extraLight =>  TextStyle(fontWeight: FontWeight.w200,color: AppColors.i.text);
  TextStyle get regular =>  TextStyle(fontWeight: FontWeight.w400,color: AppColors.i.text);
  TextStyle get medium =>  TextStyle(fontWeight: FontWeight.w500,color: AppColors.i.text);
  TextStyle get semiBold =>  TextStyle(fontWeight: FontWeight.w600,color: AppColors.i.text);
  TextStyle get bold =>  TextStyle(fontWeight: FontWeight.w700,color: AppColors.i.title);
  TextStyle get extraBold =>  TextStyle(fontWeight: FontWeight.w800, color: AppColors.i.title);
}