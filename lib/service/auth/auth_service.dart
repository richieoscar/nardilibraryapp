import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/ui/views/sign_up_screen.dart';

abstract class AuthService {
  Future<AuthResponse?> loginUser(
      String username, String password, BuildContext context);
  Future<AuthResponse?> forgotPassword(String userName, BuildContext context);
  Future<AuthResponse?> changePassword(String userName,String oldPassword, String newPassword, BuildContext context);
  Future<AuthResponse?> SignUpUser(UserInfo info,BuildContext context);
}
