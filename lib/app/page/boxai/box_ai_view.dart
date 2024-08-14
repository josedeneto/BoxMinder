import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BoxAiView extends StatefulWidget {

  const BoxAiView({ super.key });

  @override
  State<BoxAiView> createState() => _BoxAiViewState();
}

class _BoxAiViewState extends State<BoxAiView> {

   @override
   Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
       SystemUiOverlayStyle(statusBarBrightness: Brightness.light,statusBarColor: AppColors.i.primary,statusBarIconBrightness: Brightness.light)
    );
       return Scaffold(
        backgroundColor: AppColors.i.primary,
           body: SafeArea(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
               child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Expanded(
                child: SizedBox(
                       child: DefaultTextStyle(
                         style: const TextStyle(
                           fontSize: 28.0,
                         ),
                         child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          onFinished: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, AppRoutes.home);
                           // Navigator.pop(context);
                          },
                           animatedTexts: [
                             TypewriterAnimatedText('Olá outra vez, sou a BoxAI'),
                             TypewriterAnimatedText('Estou me prontificando para oferecer uma experiência incrível'),
                             TypewriterAnimatedText('Vamos explorar novas possibilidades com o poder do Gemini sobre mim'),
                             TypewriterAnimatedText('Fique à vontade e explore todas as possibilidades que a AI tem a oferecer.'),
                             TypewriterAnimatedText('Prontos, vamos começar'),
                           ],
                          
                         ),
                       ),
                     ),
              ),
             
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox( width: 26,height: 26,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: AppColors.i.primary,
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(AppColors.i.text),
                  ),
                ),
              )
                 ],
               ),
             ),
           )
           );
       
  }
}

