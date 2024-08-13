import 'dart:developer';

import 'package:appchat_with_gemini/app/model/user_model.dart';
import 'package:appchat_with_gemini/app/services/user_service_i.dart';
import 'package:flutter/material.dart';

import '../repositories/sign_in_repositories_i.dart';

class SignInController extends ChangeNotifier {
  late final SignInRepositoriesI signInRepositories;
  late UserServiceI userServiceI;
  bool _isLoading = false;

  bool get isLoading =>_isLoading;
  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
     await signInRepositories.signIn(
        UserModel(email: email, password: password),
      );
      userServiceI.setUserLoggedIn();
      log("Login efectuado com sucesso");
    } catch (e) {
      log("Login não efectuado");
    }finally{
      _isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }

  void signOut(){
    userServiceI.setUserLoggedOut();
    notifyListeners();
  }
}
