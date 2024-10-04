import 'dart:developer';
import 'package:appchat_with_gemini/app/core/config/app_config.dart';
import 'package:appchat_with_gemini/app/core/constants/app_constants.dart';
import 'package:appchat_with_gemini/app/core/helpers/mixins/snackbar_mixins.dart';
import 'package:appchat_with_gemini/app/core/helpers/mixins/toast_mixins.dart';
import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/core/ui/widgets/ai_response_message_widget.dart';
import 'package:appchat_with_gemini/app/page/home/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../core/helpers/mixins/dialog_mixins.dart';
import 'components/example_questions.dart';
import 'components/image_selected_widget.dart';
import 'components/menu.dart';
import 'components/menu_item.dart';
import 'components/message_box_tile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with ToastMixins, SnackbarMixins, MessageDialog {
  late final TextEditingController inputController;
  bool showWindows = false;
  bool containsImage = false;
  bool showWelcomeMessage = true;
  late String modelResponseAI;
  bool isLoading = false;
  
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
    var permission = await Permission.photos.status;
    if (permission.isGranted) {
       selectImages();
      log('Permissão já concedida');
    } else if (permission.isDenied) {
      permission = await Permission.photos.request();
      if (permission.isGranted) {
        selectImages();
      } else {
        showToast('Permissão negada');
      }
    } else if (permission.isPermanentlyDenied) {
      showSnackBarError(
        AppConstants.i.permanentlyDenied,
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Abrir Configurações',
          onPressed: () => openAppSettings(),
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

  Future<void> sendMessages() async {
    final prompt = TextPart(inputController.text);
    final listImages = images != null
        ? await Future.wait(
            images!.map(
              (image) async {
                final bytes = await image.readAsBytes();
                return DataPart('image/${image.path.split('.').last}', bytes);
              },
            ),
          )
        : [];
    setState(() {
      isLoading = true;
      messages.insert(
        0,
        MessageModel(
            message: prompt.text, isSentByme: true, images: listImages),
      );
      inputController.clear();
      images = [];
      showWelcomeMessage = false;
    });

    final content = [
      Content.multi([prompt, ...listImages])
    ];
    final response = await AppConfig.i.modelAi.generateContent(content);
    modelResponseAI = response.text!;

    setState(() {
      isLoading = false;
      messages.insert(
        0,
        MessageModel(
          message: modelResponseAI,
          isSentByme: false,
        ),
      );
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
      backgroundColor: AppColors.i.primary,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Stack(
              children: [
                if (showWelcomeMessage)
                  AiResponseMessageWidget(
                    message: AppConstants.i.defaultMessageAI,
                  ),
                GestureDetector(
                  onTap: (){
                    if(showWindows)hiddenMenu();
                  },
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
                  bottom: !showWindows && images!.isNotEmpty ? 65 : -150,
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
                              (i) => ImageSelectWidget(image: i),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                if (showWelcomeMessage)
                  ExampleQuestions(showWindows: showWindows, images: images),
                Menu(
                  showWindows: showWindows,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MenuItemTile(
                        icon: Iconsax.image,
                        text: 'Galeria',
                        onTap: () {
                          checkAndRequestPermission();
                          hiddenMenu();  
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
                      color: AppColors.i.primary,
                      child: TextFormField(
                        maxLines: null,
                        controller: inputController,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed:onItemTaped,
                            icon: Icon(
                              Iconsax.paperclip,
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
                                  child: Icon(
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
                                        FocusScope.of(context).unfocus();
                                      },
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        inputController.text.isNotEmpty ||
                                                images!.isNotEmpty ||
                                                isLoading
                                            ? AppColors.i.text
                                            : AppColors.i.disableButton,
                                    child: Icon(
                                      isLoading
                                          ? Icons.stop_rounded
                                          : Iconsax.arrow_up_3,
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
