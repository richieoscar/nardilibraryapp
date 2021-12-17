import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl implements StorageService {
  StorageServiceImpl._internal();
  static final StorageServiceImpl _instance = StorageServiceImpl._internal();
  static get instance => _instance;

  SharedPreferences? _userNamePref;
  SharedPreferences? _userRolePref;
  SharedPreferences? _userEmailPref;

  @override
  String? getUserName() {
    return _userNamePref!.getString("userName");
  }

  @override
  Future<bool> saveUserName(String username) async {
    _userNamePref = await SharedPreferences.getInstance();
    return await _userNamePref!.setString("userName", username);
  }

  @override
  String? getRole() {
    return _userRolePref!.getString("role");
  }

  @override
  Future<void> saveRole(String role) async {
    _userRolePref = await SharedPreferences.getInstance();
    _userRolePref!.setString("role", role);
  }

  @override
  Future<void>? saveEmail(String email) async {
    _userEmailPref = await SharedPreferences.getInstance();
    _userEmailPref!.setString("email", email);
  }

  @override
  String? getEmail() {
   return  _userEmailPref!.getString("email");
  }
}
