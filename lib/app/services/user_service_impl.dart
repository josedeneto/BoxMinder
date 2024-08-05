import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../core/helpers/shared_preferences_helper.dart';
import 'user_service_i.dart';

class UserServiceImpl implements UserServiceI {
  late final SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferencesHelper.getInstance();
  }

  @override
  Future<void> setUserLoggedIn() async {
    try {
      await _prefs.setBool('isLoggedIn', true);
    } catch (e, stackTrace) {
      log("Erro ao salvar usuário como logado: $e", stackTrace: stackTrace);
    }
  }

  @override
  Future<void> setUserLoggedOut() async {
    try {
      await _prefs.setBool('isLoggedIn', false);
    } catch (e, stackTrace) {
      log('Falha ao salvar logout do usuário: $e', stackTrace: stackTrace);
    }
  }

  @override
  Future<bool> checkLoginStatus() async {
    final isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }
}
