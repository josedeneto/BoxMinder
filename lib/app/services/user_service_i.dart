abstract class UserServiceI {
  Future<void> setUserLoggedIn();
  Future<void> setUserLoggedOut();
  Future<bool> checkLoginStatus();
}
