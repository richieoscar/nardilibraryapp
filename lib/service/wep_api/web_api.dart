import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';

abstract class WebApi {
  Future<AuthResponse?> login(String username, String password);
   Future<AuthResponse?> forgotPassword(String userName);
  Future<AuthResponse?> changePassword(String userName, String password, String newPassword);
  Future<AuthResponse?> SignUpUser(UserInfo info);

}
