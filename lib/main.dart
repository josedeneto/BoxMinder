import 'package:appchat_with_gemini/app/app_box_ai.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/services/user_service_impl.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
    final userService = UserServiceImpl();
  await userService.initialize();
   await Supabase.initialize(
    url: 'https://cadcotqkjjpvkbmxpqpn.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNhZGNvdHFrampwdmtibXhwcXBuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM1NTY5OTUsImV4cCI6MjAzOTEzMjk5NX0.WAJMlaKlFwNNR3uor2gL1hlkJFYoD-Cllv-l_ZXY-Po',
  );
  runApp(const AppBoxAi());
}
