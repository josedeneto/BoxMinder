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
    return ListTile(
      title: Align(
        alignment: messageTile.isSentByme
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: messageTile.isSentByme
                ? const Color(0XFF232323)
                : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              messageTile.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
