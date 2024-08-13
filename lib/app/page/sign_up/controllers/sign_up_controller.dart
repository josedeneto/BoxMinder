import 'dart:developer';

import 'package:appchat_with_gemini/app/model/user_model.dart';
import 'package:flutter/material.dart';

import 'package:appchat_with_gemini/app/page/sign_up/repositories/sign_up_repository_i.dart';

class SignUpController extends ChangeNotifier {
  final SignUpRepositoryI signUpRepository;
   bool _isLoading = false;

  bool get isLoading =>_isLoading;
  String? get errorMessage => _errorMessage;
  String? _errorMessage;
  SignUpController({
    required this.signUpRepository,
  });

  Future<void> signUp(String email, String password)async {
    _isLoading = true;
    notifyListeners();
     try {
        await signUpRepository.signUp(UserModel(
      email: email,
      password: password,
    ));
    _errorMessage = null;
     } catch (e) {
       log("Erro ao registar usuário $e");
     } finally{
      _isLoading = false;
      notifyListeners();
     }
    notifyListeners();
  }
}
