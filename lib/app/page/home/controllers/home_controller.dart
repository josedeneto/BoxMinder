import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool showWindows = false;
  void onItemTaped() {
    showWindows = !showWindows;
    notifyListeners();
  }
}
