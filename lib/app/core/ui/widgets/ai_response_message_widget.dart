import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../colors/app_colors.dart';
import '../style/app_typography.dart';
import 'icon_button_message_widget.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AiResponseMessageWidget extends StatefulWidget {
  final String message;
  final bool isWelcomeMessage;

  const AiResponseMessageWidget(
      {super.key, required this.message, this.isWelcomeMessage = true});

  @override
  State<AiResponseMessageWidget> createState() =>
      _AiResponseMessageWidgetState();
}

class _AiResponseMessageWidgetState extends State<AiResponseMessageWidget> {
  FlutterTts flutterTts = FlutterTts();
  var isSpeaking = false;
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
          padding: const EdgeInsets.only(left: 35, bottom: 5),
          child: Text(
            widget.message,
            style: AppTypography.i.medium.copyWith(
              fontSize: 13,
              color: AppColors.i.greyShade400,
            ),
          ),
        ),
        if (!widget.isWelcomeMessage) ...[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!isSpeaking) ...[
                  IconButtonMessageWidget(
                    icon: Iconsax.volume_high,
                    onPressed: () async {
                      setState(() {
                        isSpeaking = true;
                      });
                      await flutterTts.speak(widget.message);
                      await flutterTts.setLanguage("pt-BR");
                      flutterTts.awaitSynthCompletion(true);
                      setState(() {
                        isSpeaking = true;
                      });
                    },
                  )
                ] else ...[
                  IconButtonMessageWidget(
                    icon: Icons.stop_circle_rounded,
                    onPressed: () async {
                      final result = await flutterTts.stop();

                      if (result == 1) {
                        setState(() {
                          isSpeaking = false;
                        });
                      }
                    },
                  )
                ],
                IconButtonMessageWidget(
                  icon: Iconsax.document_copy,
                  onPressed: () {},
                ),
                IconButtonMessageWidget(
                  icon: Iconsax.share,
                  onPressed: () {},
                ),
                IconButtonMessageWidget(
                  icon: Iconsax.like_1,
                  onPressed: () {},
                ),
                IconButtonMessageWidget(
                  icon: Iconsax.dislike,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ]
      ],
    );
  }
}
