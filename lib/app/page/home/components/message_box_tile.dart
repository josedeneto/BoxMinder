import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/core/ui/style/app_typography.dart';
import 'package:appchat_with_gemini/app/core/ui/widgets/ai_response_message_widget.dart';
import 'package:flutter/material.dart';

import '../model/message_model.dart';

class MessageBoxTile extends StatelessWidget {
  const MessageBoxTile({
    super.key,
    required this.messageTile,
  });

  final MessageModel messageTile;

  @override
  Widget build(BuildContext context) {
    if (!messageTile.isSentByme) {
      return AiResponseMessageWidget(
        message: messageTile.message ?? '',
        isWelcomeMessage: false,
      );
    } else {
      return ListTile(
        title: Align(
          alignment: messageTile.isSentByme
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (messageTile.images != null && messageTile.images!.isNotEmpty)
                Wrap(
                  spacing: 5,
                  runSpacing: 3,
                  children: messageTile.images!
                      .map(
                        (image) => SizedBox(
                          width: messageTile.images!.length == 1 ? 160 : 100,
                          height: messageTile.images!.length == 1 ? 150 : 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                              image.bytes,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              if (messageTile.message != null &&
                  messageTile.message!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: messageTile.isSentByme
                          ? AppColors.i.borderSide
                          : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        messageTile.message!,
                        style: AppTypography.i.medium.copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                )
              else if (messageTile.message!.isEmpty &&
                  messageTile.message == null)
                const SizedBox.shrink()
            ],
          ),
        ),
      );
    }
  }
}
