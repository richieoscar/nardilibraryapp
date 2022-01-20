import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/auth/auth_data.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/model/auth/user_response.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/auth/auth_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:nardilibraryapp/util/validate_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFormViewModel extends ChangeNotifier {
  final AuthService _service = AuthServiceImpl.instance;
  StorageService _storageService = StorageServiceImpl.instance;

  LoginFormViewModel() {
    getCachedDetails();
  }

  bool _isVisible = false;
  String? _email;
  String? _username = "";
  int? _id;

  get username => _username;

  get id => _id;

  UserInfo? user;
  String? get email => _email;

  bool get isVisible => _isVisible;
  bool _isGettingUser = false;
  get isGetUser => _isGettingUser;

 

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  getCachedDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _id = pref.getInt("id");
    _username = pref.getString("userName");
    _email = pref.getString("email");
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    _isVisible = true;
    notifyListeners();
    AuthResponse? response = await _service.loginUser(email, password, context);
    if (response!.status == "success") {
      _storageService.saveEmail(email);
      getUser(email, context);
      // print(_storageService.getEmail());
      isVisible = false;
      notifyListeners();
    }

    if (response.status == "failed") {
      isVisible = false;
      notifyListeners();
    }
  }

  getUser(String email, BuildContext context) async {
    _isGettingUser = true;
     
    UserResponse? response = await _service.getUser(email, context);

    if (response == null) {
      print("Response null herr");
      print(response);
    }

    if (response?.status == SUCCESS) {
      user = response?.userInfo;
      _isGettingUser = false;
      notifyListeners();
    } else {
      AppUtils.showSnackBar(context, "Could not fetch User, Try Again");
    }
  }

  updateUser(UserInfo info, BuildContext context) async {
    if (!validateEmail(info.email)) {
      isVisible = false;
      AppUtils.showSnackBar(context, "Invalid Email");
      return;
    }
    // notifyListeners();
    UserResponse? response = await _service.updateUser(info, context);

    if (response == null) {
      print("Response null herr");
      print(response);
    }

    if (response?.status == SUCCESS) {
      AppUtils.showSnackBar(context, "Profile Updated");
      isVisible = false;
      notifyListeners();
    } else {
      isVisible = false;
      notifyListeners();
      AppUtils.showSnackBar(context, "Could not Update Profile, Try Again");
    }
  }

  bool validateEmail(String email) {
    return Validate.validateEmail(email);
  }

  void keepMeLoggedIn(bool isLoggedIn) {
    _storageService.keepMeLoggedIn(isLoggedIn);
    print("Saving is checked option $isLoggedIn");
  }
}
