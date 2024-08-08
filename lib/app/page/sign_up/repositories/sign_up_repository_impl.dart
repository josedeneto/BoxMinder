import 'package:appchat_with_gemini/app/model/user_model.dart';
import 'package:appchat_with_gemini/app/page/sign_up/repositories/sign_up_repository_i.dart';
import 'package:appchat_with_gemini/app/services/user_service_i.dart';

class SignUpRepositoryImpl implements SignUpRepositoryI {
  final UserServiceI userService;
  SignUpRepositoryImpl({
    required this.userService,
  });
  
  @override
  Future<void> signUp(UserModel userModel) async {
    
  await  userService.setUserLoggedIn();
  }
  
}
