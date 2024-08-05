import 'package:appchat_with_gemini/app/model/user_model.dart';

abstract class SignUpRepositoryI {
Future<void> signUp(UserModel userModel);
}