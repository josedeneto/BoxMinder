import 'package:appchat_with_gemini/app/app_box_ai.dart';
import 'package:appchat_with_gemini/app/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/services/user_service_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  final userService = UserServiceImpl();
  await userService.initialize();
  await Supabase.initialize(
    url: AppConfig.i.supabaseUrl,
    anonKey: AppConfig.i.supabaseAnonKey,
  );
  runApp(const AppBoxAi());
}
