class AppConstants {
  static AppConstants? _instance;
  AppConstants._();

  static AppConstants get i {
    _instance ??= AppConstants._();
    return _instance!;
  }

  String defaultMessageAI =
      'Olá, sou a BoxAI! Com o poder do Gemini por trás de mim, estou aqui para tornar sua experiência incrível. Pergunte o que quiser, e eu farei o meu melhor para ajudar, no idioma que você preferir.';
}
