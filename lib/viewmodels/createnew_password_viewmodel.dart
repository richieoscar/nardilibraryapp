import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/auth/auth_service_impl.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/ui/views/password_reset_complete.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:nardilibraryapp/util/validate_util.dart';

class CreateNewPasswordViewmodel extends ChangeNotifier {
  final NavigationService _navService = NavigationServiceImpl.instance;
  final AuthService _authService = AuthServiceImpl.instance;
  final StorageService _storageService = StorageServiceImpl.instance;

  bool _isVisible = false;

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  void createNewPassword(String oldPassword, String newPassword,
      String confirmNewPassword, BuildContext context) async {
    String? username = _storageService.getUserName();
    
    if (!passwordMatch(newPassword, confirmNewPassword)) {
      isVisible = false;
      AppUtils.showSnackBar(context, "Password do not match");
      return;
    }

    if (!isValidLength(newPassword, confirmNewPassword)) {
      isVisible = false;
      AppUtils.showSnackBar(
          context, "Password Should be more than 6 characters");
      return;
    }

      AuthResponse? response = await _authService.changePassword(
          username!, oldPassword, newPassword, context);

      if (response!.status == SUCCESS) {
        isVisible = false;
        _navService.navigate(PasswordResetComplete.routeName, context);
      }
      if (response.status == FAILED) {
        isVisible = false;
        AppUtils.showSnackBar(context, "Please enter the old password sent to your email");
      }
    
  }

  bool passwordMatch(String password, String confirmPassword) {
    return Validate.passwordMatch(password, confirmPassword);
  }

  bool isValidLength(String password, String confirmPassword) {
    return Validate.isValidLength(password, confirmPassword);
  }
}
