import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/auth/auth_service_impl.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:nardilibraryapp/util/validate_util.dart';

class SignUpViewmodel extends ChangeNotifier {
  final AuthService _service = AuthServiceImpl.instance;
  bool _isVisible = false;
  bool _isChecked = false;
  bool get isChecked => _isChecked;
  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  set isChecked(bool value) {
    _isChecked= value;
    notifyListeners();
  }

  void signUpUser(
      UserInfo info, String confirmPassword, BuildContext context) async {
    if (!passwordMatch(info.password, confirmPassword)) {
      AppUtils.showSnackBar(context, "Password do not match");
       isVisible = false;
      return;
    }

    if (!isValidLength(info.password, confirmPassword)) {
       isVisible = false;
      AppUtils.showSnackBar(context, "Password too short");
      return;
    }

    if(!_isChecked){
       isVisible = false;
       AppUtils.showSnackBar(context, "Please Agree to T&C");
      return;
    }

    if (!validateEmail(info.email)) {
       isVisible = false;
      AppUtils.showSnackBar(context, "Invalid Email");
      return;
    }

    AuthResponse? response = await _service.SignUpUser(info, context);
    if (response!.status == SUCCESS) {
      isVisible = false;
    }

    if (response.status == FAILED) {
      isVisible = false;
    }
  }

   void signUpUserAsAdmin(
      UserInfo info, String confirmPassword, BuildContext context) async {
    if (!passwordMatch(info.password, confirmPassword)) {
      AppUtils.showSnackBar(context, "Password do not match");
       isVisible = false;
      return;
    }

    if (!isValidLength(info.password, confirmPassword)) {
       isVisible = false;
      AppUtils.showSnackBar(context, "Password too short");
      return;
    }

    if(!_isChecked){
       isVisible = false;
       AppUtils.showSnackBar(context, "Please Agree to T&C");
      return;
    }

    if (!validateEmail(info.email)) {
       isVisible = false;
      AppUtils.showSnackBar(context, "Invalid Email");
      return;
    }

    AuthResponse? response = await _service.SignUpUserAsAdmin(info, context);
    if (response!.status == SUCCESS) {
      isVisible = false;
    }

    if (response.status == FAILED) {
      isVisible = false;
    }
  }

  bool passwordMatch(String password, String confirmPassword) {
    return Validate.passwordMatch(password, confirmPassword);
  }

  bool isValidLength(String password, String confirmPassword) {
    return Validate.isValidLength(password, confirmPassword);
  }

  bool validateEmail(String email) {
    return Validate.validateEmail(email);
  }
}
