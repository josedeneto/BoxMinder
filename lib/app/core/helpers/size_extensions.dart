import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  double percentWidth(double percent) => width * percent;
  double percentHeight(double percent) => height * percent;
}
