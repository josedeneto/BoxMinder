import 'package:appchat_with_gemini/app/page/sign_up/controllers/sign_up_controller.dart';
import 'package:appchat_with_gemini/app/page/sign_up/repositories/sign_up_repository_impl.dart';
import 'package:appchat_with_gemini/app/page/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repositories/sign_up_repository_i.dart';

class SignUpRoute {
  Widget page() {
    return MultiProvider(
      providers: [
        Provider<SignUpRepositoryI>(
          create: (context) => SignUpRepositoryImpl(
            userService: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpController(
            signUpRepository: context.read<SignUpRepositoryI>(),
          ),
        )
      ],
      child: const SignUpView(),
    );
  }
}
