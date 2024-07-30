import 'package:appchat_with_gemini/message_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController inputController;
  bool isNoEmpty = false;
  bool showWindows = false;
  void onItemTaped(){
    setState(() {
      showWindows=!showWindows;
    });
  }

  List<MessageModel> messages = [];

  void sendMessages(){
   setState(() {
      messages.insert(0, MessageModel(message: inputController.text, isSentByme: true));
      inputController.clear();
   });

   Future.delayed(const Duration(seconds: 2),(){
    setState(() {
      messages.insert(0, MessageModel(message: "Reply to ${inputController.text}", isSentByme: false));
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
                    return ListTile(
                      title: Align(
                        alignment: messageTile.isSentByme? Alignment.centerRight:Alignment.centerLeft,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10), bottomLeft:Radius.circular(10) ),
                            color: messageTile.isSentByme?const Color(0XFF232323):Colors.transparent
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
                  },
                ),
              ),
            ),
           AnimatedPositioned(
             duration: const Duration(milliseconds:500),
              bottom: showWindows ? 60 : -150, // Ajuste a altura aqui para ocultar a janela
              left: 0,
              right: 0,
             child: Container(
               decoration: BoxDecoration(
                 color: const Color(0XFF1C1C1C),
                border: Border.all(color:const Color(0XFF343434),),
                borderRadius: BorderRadius.circular(16)
               ),
               padding: const EdgeInsets.all(16),
               child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   MenuItem(
                    icon:Iconsax.image ,
                    text: 'Galeria',
                   ),
                   MenuItem(icon: Iconsax.document, text: 'Documento'),
                   MenuItem(icon: Iconsax.audio_square, text: 'Áudio'),
                 ],
               ),
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
                        onTap: (){
                          onItemTaped();
                        },
                        child: const Icon(Icons.attach_file_rounded, color: Colors.white,size: 23,),),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Color(0XFF343434),
                        ),
                      ),
                      focusedErrorBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      errorBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Color(0XFF343434),
                        ),
                      ),
                      hintText: "Type your message...",
                      hintStyle: const TextStyle(
                        color: Color(0XFF737373),
                        fontWeight: FontWeight.normal,
                      ),
                      isDense: true,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if(inputController.text.isEmpty)
                          GestureDetector(
                            onTap: (){},
                            child: const Icon(Icons.mic_none_rounded, color: Colors.white,size: 26,),),
                            const SizedBox(width: 5,),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Color(0XFF343434),
                        ),
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

class MenuItem extends StatelessWidget {
 final IconData icon;
 final String text;
  const MenuItem({
    super.key,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
           decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 26, 26),
             border: Border.all(color:const Color(0XFF343434) ),
             borderRadius: BorderRadius.circular(10)
           ),
           child:  Padding(
             padding: const EdgeInsets.all(16.0),
             child:  Icon(icon, color: Colors.white,),
           ),
          ),
          const SizedBox(height: 5,),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 14),)
        ],
      ),
    );
  }
}
