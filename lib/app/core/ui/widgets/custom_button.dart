import 'package:appchat_with_gemini/app/core/ui/style/app_style.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../style/app_typography.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AppStyle.i.buttonStyle,
      child: Text(
        text,
        style: AppTypography.i.extraLight.copyWith(
          color: AppColors.i.primary,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
