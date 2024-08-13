import 'package:appchat_with_gemini/app/model/user_model.dart';

abstract class SignInRepositoriesI {
  Future<void> signIn(UserModel userModel);
  Future<void> signOut();
}
