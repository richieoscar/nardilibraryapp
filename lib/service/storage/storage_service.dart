abstract class StorageService {
  Future<bool> saveUserName(String username);

  String? getUserName();

  Future<bool?> saveRole(String? role);

   Future<void> saveUserID(String id);

   Future<void> clear();

  String? getRole();
  

  Future<void>? saveEmail(String email);
  String? getEmail();

  Future<void> keepMeLoggedIn(bool isLoggedIn);

  Future<bool?> getKeepMeLoggedIn();
}
