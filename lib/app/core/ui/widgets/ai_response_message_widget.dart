import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../colors/app_colors.dart';
import '../style/app_typography.dart';

class AiResponseMessageWidget extends StatelessWidget {
  final String message;
  const AiResponseMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.i.white,
              child: Icon(
                Iconsax.dcube,
                size: 12,
                color: AppColors.i.primary,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'BoxAI',
              style: AppTypography.i.medium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, bottom: 20),
          child: Text(
            message,
            style: AppTypography.i.medium.copyWith(
              fontSize: 13,
              color: AppColors.i.greyShade400,
            ),
          ),
        ),
      ],
    );
  }
}
