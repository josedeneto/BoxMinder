import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:appchat_with_gemini/app/model/user_model.dart';
import 'package:appchat_with_gemini/app/page/sign_up/repositories/sign_up_repository_i.dart';
import 'package:appchat_with_gemini/app/services/user_service_i.dart';

class SignUpRepositoryImpl implements SignUpRepositoryI {
  final UserServiceI userService;
  final SupabaseClient supabaseClient;
  SignUpRepositoryImpl({
    required this.userService,
    required this.supabaseClient,
  });

  @override
  Future<void> signUp(UserModel userModel) async {
   try {
     await supabaseClient.auth.signUp( email: userModel.email,password: userModel.password,data:{
      'name':userModel.name
    });
     await userService.setUserLoggedIn();
    log("Usuário salvo com sucesso");
   } catch (e) {
      log("Erro ao salvar usuário");
   }
   
  }
}
