
import 'package:flutter/material.dart';

class AppColors{
 static AppColors? _instance;
  AppColors._();


  static AppColors get i {
    _instance??= AppColors._();
    return _instance!;
  }
  
  static Color  primary = const Color(0XFF09090B);
  Color get title => const Color(0XFFFAFAFA);
  Color get text => const Color(0XFFD4D4D8);
  Color get border => const Color(0XFF27272A);
  Color get hintTextField =>const  Color(0XFF18181B);
  Color get green => const Color(0XFF6EE7B7);
  Color get button => const Color(0XFFE4E4E7);
  Color get textButton=> const Color(0XFF27272A);
  Color get grey => const Color(0XFFD4D4D8);
  
}

