import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl implements StorageService {
  StorageServiceImpl._internal();
  static final StorageServiceImpl _instance = StorageServiceImpl._internal();
  static get instance => _instance;

  SharedPreferences? _storagePref;

  @override
  String? getUserName() {
    // return _userNamePref!.getString("userName");
  }

  @override
  Future<bool> saveUserName(String username) async {
    _storagePref = await SharedPreferences.getInstance();
    return await _storagePref!.setString("userName", username);
  }

  @override
  String? getRole() {
    //  return _storagePref?.getString("role");
  }

  @override
  Future<bool?> saveRole(String? role) async {
    _storagePref = await SharedPreferences.getInstance();
    return await _storagePref?.setString("role", role!);
  }

  @override
  Future<void>? saveEmail(String email) async {
    _storagePref = await SharedPreferences.getInstance();
    _storagePref!.setString("email", email);
  }

  @override
  String? getEmail() {
    return _storagePref!.getString("email");
  }

  @override
  Future<bool?> getKeepMeLoggedIn() async {
    _storagePref = await SharedPreferences.getInstance();
    return _storagePref!.getBool("isLoggedIn");
  }

  @override
  Future<void> keepMeLoggedIn(bool isLoggedIn) async {
    _storagePref = await SharedPreferences.getInstance();
    _storagePref!.setBool("isLoggedIn", isLoggedIn);
  }

  @override
  Future<void> saveUserID(String id) async {
    _storagePref = await SharedPreferences.getInstance();
    _storagePref!.setString("id", id);
  }

  @override
  Future<void> clear() async {
    _storagePref = await SharedPreferences.getInstance();
    bool isCleared = await _storagePref!.clear();
    if (isCleared) print("Storage Pref cleared");
  }
}
