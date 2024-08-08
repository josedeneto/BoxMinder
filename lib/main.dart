import 'package:appchat_with_gemini/app/app_box_ai.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/services/user_service_impl.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
    final userService = UserServiceImpl();
  await userService.initialize();
   await Supabase.initialize(
    url: 'https://dnyfgutswnqdtavsbner.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRueWZndXRzd25xZHRhdnNibmVyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjMxMjYyNjMsImV4cCI6MjAzODcwMjI2M30.QrIjg24vp_8cEAH2qhv9o01iC7KX98WSCxa3BM8GnQQ',
  );
  runApp(const AppBoxAi());
}
