import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:appchat_with_gemini/app/model/user_model.dart';
import 'package:appchat_with_gemini/app/page/sign_up/repositories/sign_up_repository_i.dart';
import 'package:appchat_with_gemini/app/services/user_service_i.dart';

class SignUpRepositoryImpl implements SignUpRepositoryI {
  final UserServiceI userService;
 
  SignUpRepositoryImpl({
    required this.userService,
  });
  final supabase = Supabase.instance.client;
  @override
  Future<void> signUp(UserModel userModel) async {
    try {
      await supabase.auth.signUp(
        email: userModel.email,
        password: userModel.password,
      );
      await userService.setUserLoggedIn();
      log("Usuário salvo com sucesso");
    } on AuthException catch(e){
      log(e.message);
    } 
    
    catch (e) {
      log("Erro ao salvar usuário: $e");
    }
  }
}
