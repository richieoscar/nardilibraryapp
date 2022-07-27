import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';

import '../model/auth/user_response.dart';
import '../service/auth/auth_service.dart';
import '../service/auth/auth_service_impl.dart';
import '../util/utils.dart';
import '../util/validate_util.dart';

class UpdateUserViewmodel extends ChangeNotifier {
  final AuthService _service = AuthServiceImpl.instance;
  final NavigationService _navServcie = NavigationServiceImpl.instance;

  UserInfo? _user;
  bool _isGettingUser = false;
  bool _isDone = false;
  bool _updatingUser = false;

  get user => _user;
  get isVisible => _isGettingUser;
  get isDone => _isDone;
  get isUpdating => _updatingUser;

  void setVisible(bool visible) {
    _isGettingUser = visible;
    notifyListeners();
  }

  void setIsDone() {
    _isGettingUser = false;
    notifyListeners();
  }

  void setUpdateingUser() {
    _updatingUser = true;
    notifyListeners();
  }

  Future<void> getUser(String email, BuildContext context) async {
    _isGettingUser = true;
    UserResponse? response = await _service.getUser(email, context);
    if (response == null) {
      print("Response null herr");
      print(response);
    }
    if (response?.status == SUCCESS) {
      _isGettingUser = false;
      _user = response!.userInfo;
      print("Printing user");
      print(user);
      _isDone = true;
      notifyListeners();
    } else {
      AppUtils.showSnackBar(context, "Could not fetch User, Try Again");
    }
  }

  updateUser(UserInfo info, BuildContext context) async {
    _updatingUser = true;
    _isGettingUser = false;
    if (!validateEmail(info.email)) {
      _updatingUser = false;
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
      //AppUtils.showSnackBar(context, "Profile Updated");
      _updatingUser = false;
      _isDone = false;
      setVisible(false);
      notifyListeners();
      _navServcie.pop(context);
    } else {
      _updatingUser = false;
      notifyListeners();
      AppUtils.showSnackBar(context, "Could not Update Profile, Try Again");
    }
  }

  bool validateEmail(String email) {
    return Validate.validateEmail(email);
  }
}
