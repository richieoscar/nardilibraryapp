import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/service/wep_api/web_api.dart';
import 'package:nardilibraryapp/service/wep_api/web_api_impl.dart';
import 'package:nardilibraryapp/ui/views/create_new_password.dart';
import 'package:nardilibraryapp/ui/views/dasboard_screen.dart';
import 'package:nardilibraryapp/ui/views/finish_registration.dart';
import 'package:nardilibraryapp/ui/views/password_reset_complete.dart';
import 'package:nardilibraryapp/ui/views/verify_email_screen.dart';
import 'package:nardilibraryapp/util/utils.dart';

class AuthServiceImpl implements AuthService {
  AuthServiceImpl._internal();
  static final AuthServiceImpl _instance = AuthServiceImpl._internal();
  StorageService _storageService = StorageServiceImpl.instance;
  static get instance => _instance;

  final WebApi _apiService = WebApiImpl.instance;
  final NavigationService _navService = NavigationServiceImpl.instance;

  @override
  Future<AuthResponse?> loginUser(
      String username, String password, BuildContext context) async {
    AuthResponse? response = await _apiService.login(username, password);

    if (response!.status == "success") {
      print(response.message);
      await _storageService.saveUserName(response.message);
      _navService.navigate(Dashboard.routeName, context);
      return response;
    }
    if (response.status == "failed") {
      AppUtils.showSnackBar(context, "Invalid Details");
    }
    return response;
  }

  @override
  Future<AuthResponse?> SignUpUser(UserInfo info, BuildContext context) async {
    AuthResponse? response = await _apiService.SignUpUser(info);

    if (response!.status == "success") {
      print(response);
      _navService.navigate(FinishRegistration.routeName, context);
      return response;
    }
    if (response.status == "failed") {
      AppUtils.showSnackBar(context, "An Error Occured, Try again!");
      print(response.status);
    }
    return response;
  }

  @override
  Future<AuthResponse?> changePassword(String userName, String oldPassword,
      String newPassword, BuildContext context) async {
    AuthResponse? response =
        await _apiService.changePassword(userName, oldPassword, newPassword);

    if (response!.status == "success") {
      print(response);
      _navService.navigate(PasswordResetComplete.routeName, context);
      return response;
    }
    if (response.status == "failed") {
      // AppUtils.showSnackBar(context, "An Error Occured, Try again!");
      return response;
    }
  }

  @override
  Future<AuthResponse?> forgotPassword(
      String userName, BuildContext context) async {
    AuthResponse? response = await _apiService.forgotPassword(userName);

    if (response != null) {
      if (response.status == "success") {
        print(response);
        _navService.navigate(VerifyEmail.route, context);
        return response;
      }
      if (response.status == "failed") {
        AppUtils.showSnackBar(context, "Invalid Username, Try again!");
      }
    }

    return response;
  }
}
