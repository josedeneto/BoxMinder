
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _instance;

  SharedPreferencesHelper._();
 

 static Future<SharedPreferences>  getInstance() async {
    _instance??=await SharedPreferences.getInstance();
    return _instance!;
  }
}