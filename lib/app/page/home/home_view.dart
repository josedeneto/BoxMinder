import 'package:appchat_with_gemini/app/page/home/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'components/menu.dart';
import 'components/menu_item.dart';
import 'components/message_box_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController inputController;
  bool isNoEmpty = false;
  bool showWindows = false;
  void onItemTaped() {
    setState(() {
      showWindows = !showWindows;
    });
  }

  List<MessageModel> messages = [];

  void sendMessages() {
    setState(() {
      messages.insert(
          0, MessageModel(message: inputController.text, isSentByme: true));
      inputController.clear();
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        messages.insert(
            0,
            MessageModel(
                message: "Reply to ${inputController.text}",
                isSentByme: false));
      });
    });
  }

  @override
  void initState() {
    inputController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1C1C1C),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(
          children: [
            GestureDetector(
              onTap: onItemTaped,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 55),
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, m) {
                    final messageTile = messages[m];
                    return MessageBoxTile(messageTile: messageTile);
                  },
                ),
              ),
            ),
            Menu(
              showWindows: showWindows,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MenuItemTile(
                    icon: Iconsax.image,
                    text: 'Galeria',
                  ),
                  MenuItemTile(
                    icon: Iconsax.document,
                    text: 'Documento',
                  ),
                  MenuItemTile(
                    icon: Iconsax.audio_square,
                    text: 'Áudio',
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ColoredBox(
                  color: const Color(0XFF1C1C1C),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        inputController.text = value;
                        if (inputController.text.isNotEmpty) {
                          isNoEmpty = true;
                        } else {
                          isNoEmpty = false;
                        }
                      });
                    },
                    controller: inputController,
                    decoration: InputDecoration(
                      prefixIcon: GestureDetector(
                        onTap: () {
                          onItemTaped();
                        },
                        child: const Icon(
                          Icons.attach_file_rounded,
                          color: Colors.white,
                          size: 23,
                        ),
                      ),
                      hintText: "Type your message...",
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (inputController.text.isEmpty)
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.mic_none_rounded,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              sendMessages();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: isNoEmpty
                                    ? Colors.white
                                    : const Color.fromARGB(255, 37, 37, 37),
                                child: Icon(
                                  Icons.arrow_upward_outlined,
                                  color: isNoEmpty ? Colors.black : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
