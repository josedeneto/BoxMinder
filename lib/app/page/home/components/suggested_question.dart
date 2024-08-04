import 'package:flutter/material.dart';

import '../../../core/ui/colors/app_colors.dart';
import '../../../core/ui/style/app_typography.dart';

class SuggestedQuestion extends StatelessWidget {
  const SuggestedQuestion({super.key, required this.question});
  final String question;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: SizedBox(
        width: 180,
        height: 80,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.i.borderSide),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              question,
              style: AppTypography.i.regular.copyWith(
                color: AppColors.i.secondaryHintColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
