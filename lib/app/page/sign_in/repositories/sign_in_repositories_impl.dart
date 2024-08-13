
import 'dart:developer';

import 'package:appchat_with_gemini/app/model/user_model.dart';
import 'package:appchat_with_gemini/app/page/sign_in/repositories/sign_in_repositories_i.dart';
import 'package:appchat_with_gemini/app/services/user_service_i.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInRepositoriesImpl implements SignInRepositoriesI {
  final UserServiceI userService;
  SignInRepositoriesImpl({
    required this.userService,
  });
  final supabase = Supabase.instance.client;
  @override
  Future<void> signIn(UserModel userModel) async {
    try {
      await supabase.auth.signInWithPassword(
          email: userModel.email, password: userModel.password);
    } catch (e) {
      log("Erro ao efectuar login");
    }
  }

  @override
  Future<void> signOut() async{
   await supabase.auth.signOut();
  }
}
