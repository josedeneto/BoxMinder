import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'user_service_i.dart';

class UserServiceImpl implements UserServiceI {

  @override
  Future<void> setUserLoggedIn() async {
    
    try {
       final prefs = await SharedPreferences.getInstance();
       prefs.setBool('isLoggedIn', true);
    } catch (e, stackTrace) {
      log("Erro ao salvar usuário como logado: $e", stackTrace: stackTrace);
    }
  }

  @override
  Future<void> setUserLoggedOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', false);
    } catch (e, stackTrace) {
      log('Falha ao salvar logout do usuário: $e', stackTrace: stackTrace);
    }
  }

  @override
  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }
}
