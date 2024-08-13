import 'package:appchat_with_gemini/app/page/sign_in/repositories/sign_in_repositories_impl.dart';
import 'package:appchat_with_gemini/app/page/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/sign_in_controllers.dart';

class SignInRoute {
  Widget page() {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => SignInRepositoriesImpl(
            userService: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInController(),
        ),
      ],
      child: const SignInView(),
    );
  }
}