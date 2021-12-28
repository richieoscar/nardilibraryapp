import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/model/auth/user_response.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/service/wep_api/web_api.dart';
import 'package:nardilibraryapp/service/wep_api/web_api_impl.dart';
import 'package:nardilibraryapp/ui/views/admin_dashboard_screen.dart';
import 'package:nardilibraryapp/ui/views/create_new_password.dart';
import 'package:nardilibraryapp/ui/views/user_dashboard_screen.dart';
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
    if (response!.status == SUCCESS) {
      print(response.message);
      print(response.data.role);
      await _storageService.saveUserName(response.message);

      if (response.data.role == USER_ROLE) {
        print("User Role");
        print(response.data.role);
        _storageService.saveRole(response.data.role);
        _navService.navigateUntil(UserDashboard.routeName, context);
        return response;
      } else if (response.data.role == ADMIN) {
        _storageService.saveRole(response.data.role);
        _navService.navigate(AdminDashboard.routeName, context);
        return response;
      }
    }
    if (response.status == FAILED) {
      AppUtils.showSnackBarforNetwork(context, response.message);
    }
    return response;
  }

  @override
  Future<AuthResponse?> SignUpUser(UserInfo info, BuildContext context) async {
    AuthResponse? response = await _apiService.SignUpUser(info);

    if (response!.status == SUCCESS) {
      print(response);
      _navService.navigate(FinishRegistration.routeName, context);
      return response;
    }
    if (response.status == FAILED) {
      AppUtils.showSnackBar(context, response.message);
      print(response.status);
    }
    return response;
  }

  @override
  Future<AuthResponse?> SignUpUserAsAdmin(
      UserInfo info, BuildContext context) async {
    AuthResponse? response = await _apiService.SignUpUser(info);

    if (response!.status == SUCCESS) {
      print(response);
      AppUtils.showSnackBar(context, "User Created Succesfully");
      return response;
    }
    if (response.status == FAILED) {
      AppUtils.showSnackBar(context, response.message);
      print(response.status);
    }
    return response;
  }

  @override
  Future<AuthResponse?> changePassword(String userName, String oldPassword,
      String newPassword, BuildContext context) async {
    AuthResponse? response =
        await _apiService.changePassword(userName, oldPassword, newPassword);

    if (response!.status == SUCCESS) {
      print(response);
      _navService.navigate(PasswordResetComplete.routeName, context);
      return response;
    }
    if (response.status == FAILED) {
      AppUtils.showSnackBar(context, "An Error Occured, Try again!");
      return response;
    }
  }

  @override
  Future<AuthResponse?> forgotPassword(
      String userName, BuildContext context) async {
    AuthResponse? response = await _apiService.forgotPassword(userName);

    if (response != null) {
      if (response.status == SUCCESS) {
        print(response);
        _navService.navigate(VerifyEmail.route, context);
        return response;
      }
      if (response.status == FAILED) {
        AppUtils.showSnackBar(context, "Invalid Email, Try again!");
      }
    }

    return response;
  }

  @override
  Future<AuthResponse?> deletUser(String email, BuildContext context) async {
    AuthResponse? response = await _apiService.deleteUser(email);

    if (response != null) {
      if (response.status == SUCCESS) {
        print(response);
        return response;
      }
      if (response.status == FAILED) {
        print(response);
      }
    }
    return response;
  }

  @override
  Future<UserResponse?> getUser(String email, BuildContext context) async {
    // TODO: implement getUser
    UserResponse? userResponse = await _apiService.getUser(email);
    if (userResponse != null) {
      if (userResponse.status == SUCCESS) {
        return userResponse;
      }
      if (userResponse.status == FAILED) {
        print(userResponse.message);
      }
    }
    return userResponse;
  }

  @override
  Future<UserResponse?> updateUser(UserInfo info, BuildContext context) async {
    UserResponse? response = await _apiService.updateUser(info);

    if (response!.status == SUCCESS) {
      print(response);
       AppUtils.showSnackBar(context, "Profile Updated");
      return response;
    }
    if (response.status == FAILED) {
      AppUtils.showSnackBar(context, response.message!);
      print(response.status);
    }
    return response;
  }
}
