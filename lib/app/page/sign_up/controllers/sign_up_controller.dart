

import 'package:appchat_with_gemini/app/model/user_model.dart';
import 'package:flutter/material.dart';

import 'package:appchat_with_gemini/app/page/sign_up/repositories/sign_up_repository_i.dart';

class SignUpController extends ChangeNotifier {
  final SignUpRepositoryI signUpRepository;
  SignUpController({
    required this.signUpRepository,
  });

  void signUp(String email, String password){
    signUpRepository.signUp(UserModel(name: email, email: email, password: password));
    notifyListeners();
  }
}
