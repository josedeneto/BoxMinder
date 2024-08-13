import 'package:appchat_with_gemini/app/page/home/home_route.dart';
import 'package:appchat_with_gemini/app/page/sign_in/sign_in_route.dart';
import 'package:appchat_with_gemini/app/page/sign_up/sign_up_route.dart';
import 'package:appchat_with_gemini/app/page/splash/splash_route.dart';
import 'package:appchat_with_gemini/app/page/welcome/welcome_route.dart';
import 'package:flutter/material.dart';

import '../page/boxai/box_ai_route.dart';

class AppRoutes {
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const boxai = '/boxai';
  static const home = '/home';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => SplashRoute().page(),
        welcome: (context) => WelcomeRoute().page(),
        signIn: (context) => SignInRoute().page(),
        signUp: (context) => SignUpRoute().page(),
        boxai: (context) => BoxAiRoute().page(),
        home: (context) => HomeRoute().page()
      };
}
