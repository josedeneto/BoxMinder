import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0XFF09090B);
  Color get white => Colors.white;
  Color get title => const Color(0XFFFAFAFA);
  Color get text => const Color(0XFFD4D4D8);
  Color get border => const Color(0XFF27272A);
  Color get hintTextField => const Color(0XFF4D4D4D);
  Color get green => const Color(0XFF6EE7B7);
  Color get button => const Color(0XFFE4E4E7);
  Color get textButton => const Color(0XFF27272A);
  Color get grey => const Color(0XFF343434);
  Color get greyShade400 => Colors.grey.shade400;
  Color get secondaryHintColor => const Color.fromARGB(255, 51, 51, 66);
  Color get borderSide => const Color.fromARGB(255, 23, 23, 32);
  Color get disableButton => const Color.fromARGB(59, 51, 51, 66);
}
