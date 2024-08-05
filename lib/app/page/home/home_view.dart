import 'dart:io';

import 'package:appchat_with_gemini/app/core/constants/app_constants.dart';
import 'package:appchat_with_gemini/app/core/helpers/size_extensions.dart';
import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/core/ui/style/app_typography.dart';
import 'package:appchat_with_gemini/app/core/ui/widgets/ai_response_message_widget.dart';
import 'package:appchat_with_gemini/app/page/home/components/suggested_question.dart';
import 'package:appchat_with_gemini/app/page/home/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
  bool showWindows = false;
  bool containsImage = false;
  bool showWelcomeMessage = true;
  
  void onItemTaped() {
    setState(() {
      showWindows = !showWindows;
    });
  }

  void hiddenMenu() {
    setState(() {
      showWindows = false;
    });
  }

  List<XFile>? images = [];
  List<MessageModel> messages = [];
  final imagePicker = ImagePicker();
  Future<void> checkAndRequestPermission() async {
    final snackBar = ScaffoldMessenger.of(context);
    var permission = await Permission.storage.status;

    if (permission.isDenied) {
      permission = await Permission.storage.request();
    }

    if (permission.isGranted) {
      selectImages();
    } else if (permission.isDenied) {
      Fluttertoast.showToast(
        msg: "Permissão negada",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        backgroundColor: const Color.fromARGB(100, 0, 0, 0),
      );
    } else if (permission.isPermanentlyDenied) {
      snackBar.showSnackBar(
        SnackBar(
          content: const Text(
              'Permissão permanentemente negada. Abra as configurações para conceder permissão.'),
          backgroundColor: Colors.red.shade700,
          action: SnackBarAction(
            textColor: Colors.white,
            label: 'Abrir Configurações',
            onPressed: () => openAppSettings(),
          ),
        ),
      );
    }
  }

  Future<void> selectImages() async {
    final imagesSelected = await imagePicker.pickMultiImage();
    setState(() {
      images = imagesSelected;
    });
  }

  void sendMessages() {
    setState(() {
      messages.insert(
        0,
        MessageModel(
            message: inputController.text,
            isSentByme: true,
            images: images?.map((image) => image.path).toList()),
      );
      inputController.clear();
      images = [];
      showWelcomeMessage = false;
     
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        messages.insert(
          0,
          MessageModel(
            message: "Reply to ${inputController.text}",
            isSentByme: false,
          ),
        );
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
      backgroundColor:AppColors.i.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Stack(
            children: [
               if (showWelcomeMessage)
               AiResponseMessageWidget(message: AppConstants.i.defaultMessageAI),
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
              
              AnimatedPositioned(
                bottom: !showWindows && images != null ? 65 : -150,
                duration: const Duration(milliseconds: 800),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: images!
                          .map(
                            (i) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  File(i.path),
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 80,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
               if (showWelcomeMessage)
              Positioned(
                bottom:context.percentHeight(.1),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 150,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.i.borderSide),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.light_mode_outlined,
                                    color: AppColors.i.text,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'Exemplos',
                                    style: AppTypography.i.light.copyWith(fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SuggestedQuestion(
                                question: 'Roadmap 2024 para aprender Flutter',
                              ),
                              SuggestedQuestion(
                                question: 'Contar uma piada para se divertir',
                              ),
                              SuggestedQuestion(
                                question:
                                    'Sugeria hábitos positivos para o bem-estar',
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Menu(
                showWindows: showWindows,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuItemTile(
                      icon: Iconsax.image,
                      text: 'Galeria',
                      onTap: () {
                        hiddenMenu();
                        checkAndRequestPermission();
                      },
                    ),
                    MenuItemTile(
                      icon: Iconsax.document,
                      text: 'Documento',
                      onTap: () {},
                    ),
                    MenuItemTile(
                      icon: Iconsax.audio_square,
                      text: 'Áudio',
                      onTap: () {},
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
                    color:AppColors.i.primary,
                    child: TextFormField(
                      controller: inputController,
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          inputController.text = value;
                        });
                      },
                     
                      decoration: InputDecoration(
                        prefixIcon: GestureDetector(
                          onTap: () {
                            onItemTaped();
                          },
                          child:  Icon(
                            Iconsax.attach_circle,
                            color: AppColors.i.text,
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
                                child:  Icon(
                                  Icons.mic_none_rounded,
                                  color: AppColors.i.text,
                                  size: 26,
                                ),
                              ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: inputController.text.isEmpty &&
                                      images!.isEmpty
                                  ? null
                                  : () {
                                      sendMessages();
                                    },
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: inputController
                                              .text.isNotEmpty ||
                                          images!.isNotEmpty
                                      ? AppColors.i.text
                                      : AppColors.i.disableButton,
                                  child: Icon(Iconsax.arrow_up_3,
                                   // Icons.arrow_upward_outlined,
                                    color: inputController.text.isNotEmpty ||
                                            images!.isNotEmpty
                                        ? AppColors.i.primary
                                        : AppColors.i.secondaryHintColor,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
