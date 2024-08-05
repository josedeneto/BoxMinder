import 'dart:developer';

import 'package:appchat_with_gemini/app/core/helpers/shared_preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  late final SharedPreferences _prefs;

  UserService(){
    _initializePrefs();
  }
  Future<void> _initializePrefs() async {
    _prefs = await SharedPreferencesHelper.getInstance();
  }

  Future<void> setUserLoggedIn() async {
    try {
      await _prefs.setBool('isLoggedIn', true);
    } catch (e) {
      log("Erro ao salvar usuário como logado");
    }
  }

  Future<void> setUserLoggedOut() async {
   try {
      await _prefs.setBool('isLoggedIn', false);
   } catch (e) {
     log('Falha ao salvar logout do usário ');
   }
  }

  Future<bool> checkLoginStatus() async {
    final isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }
}
