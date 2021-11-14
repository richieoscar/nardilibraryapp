import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl implements StorageService {
  StorageServiceImpl._internal();
  static final StorageServiceImpl _instance = StorageServiceImpl._internal();
 static get instance => _instance;

  SharedPreferences? _userNamePref;

  @override
  String? getUserName() {
    return _userNamePref!.getString("userName");
  }

  @override
  void saveUserName(String username) async {
    _userNamePref = await SharedPreferences.getInstance();
    _userNamePref!.setString("userName", username);
  }
}
