abstract class StorageService {
  Future<bool> saveUserName(String username);

  String? getUserName();

  Future<void> saveRole(String role);

  String? getRole();
}
