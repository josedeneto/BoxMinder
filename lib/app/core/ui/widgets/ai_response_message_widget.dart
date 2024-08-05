import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../colors/app_colors.dart';
import '../style/app_typography.dart';
import 'icon_button_message_widget.dart';

class AiResponseMessageWidget extends StatelessWidget {
  final String message;
  final bool isWelcomeMessage;
  const AiResponseMessageWidget({super.key, required this.message, this.isWelcomeMessage=true});
  
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
          padding: const EdgeInsets.only(left: 35, bottom: 10),
          child: Text(
            message,
            style: AppTypography.i.medium.copyWith(
              fontSize: 13,
              color: AppColors.i.greyShade400,
            ),
          ),
        ),
        if(!isWelcomeMessage)...[
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10,),
            child: Row(
             mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 IconButtonMessageWidget(icon: Iconsax.volume_high,onPressed: (){},),
                 IconButtonMessageWidget(icon: Iconsax.document_copy,onPressed: (){},),
                 IconButtonMessageWidget(icon: Iconsax.share,onPressed: (){},),
                 IconButtonMessageWidget(icon: Iconsax.like_1,onPressed: (){},),
                 IconButtonMessageWidget(icon: Iconsax.dislike,onPressed: (){},), 
              ],
            ),
          ),
          
        ]
      ],
    );
  }
}
