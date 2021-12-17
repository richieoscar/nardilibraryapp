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

class LoginFormViewModel extends ChangeNotifier {
  final AuthService _service = AuthServiceImpl.instance;
  StorageService _storageService = StorageServiceImpl.instance;
  bool _isVisible = false;
  String? _email;
  UserInfo? user;
  String? get getUsername => _email;

  set setUsername(String? email) {
    _email = email!;
    notifyListeners();
  }

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    _isVisible = true;
    notifyListeners();
    AuthResponse? response = await _service.loginUser(email, password, context);
    if (response!.status == "success") {
      _storageService.saveEmail(email);
      setUsername = email;
      getUser(email, context);
      print(_storageService.getEmail());
      isVisible = false;
      notifyListeners();
    }

    if (response.status == "failed") {
      isVisible = false;
      notifyListeners();
    }
  }

  getUser(String email, BuildContext context) async {
    // notifyListeners();
    UserResponse? response = await _service.getUser(email, context);

    if (response == null) {
      print("Response null herr");
      print(response);
    }

    if (response?.status == SUCCESS) {
      user = response?.userInfo;
      isVisible = false;
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


}
