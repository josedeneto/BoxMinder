import 'package:appchat_with_gemini/app/app_box_ai.dart';
import 'package:flutter/material.dart';

import 'app/services/user_service_impl.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
    final userService = UserServiceImpl();
  await userService.initialize();
  runApp(const AppBoxAi());
}
