import 'dart:io';

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
                        width:messageTile.images!.length==1?160:100,
                            height: messageTile.images!.length==1?150:100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                  ),        
              
            if (messageTile.message!=null && messageTile.message!.isNotEmpty)
              DecoratedBox(
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
                    messageTile.message!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ) 
              else if(messageTile.message!.isEmpty && messageTile.message==null)
              const SizedBox.shrink()
            
          ],
        ),
      ),
    );
  }
}
