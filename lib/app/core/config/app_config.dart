import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AppConfig {
  static AppConfig? _instance;
  AppConfig._();
  static AppConfig get i {
    _instance ??= AppConfig._();
    return _instance!;
  }

  late final modelAi =
      GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: geminiApiKey);
  String geminiApiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
}
