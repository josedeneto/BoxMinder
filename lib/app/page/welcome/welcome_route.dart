import 'package:appchat_with_gemini/app/page/sign_in/controllers/sign_in_controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../sign_up/controllers/sign_up_controller.dart';
import 'welcome_view.dart.dart';

class WelcomeRoute {
  Widget page() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpController(
            signUpRepository: context.read(),
          ),
        )
      ],
      child: const WelcomeView(),
    );
  }
}
