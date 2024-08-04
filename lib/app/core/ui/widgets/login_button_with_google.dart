import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style/app_typography.dart';

class LoginButtonWithGoogle extends StatelessWidget {
  const LoginButtonWithGoogle({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.i.borderSide),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/images/google_logo.svg',
              ),
              Text(
                text,
                style: AppTypography.i.medium,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.i.secondaryHintColor,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
