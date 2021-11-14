import 'dart:convert';

import 'package:http/http.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/service/wep_api/web_api.dart';

class WebApiImpl implements WebApi {
  static const String _LOGIN_URL = "http://nardlibrary.org/api/User/Login";
  static const String _SIGN_UP_URL = "http://nardlibrary.org/api/User/Register";
  static const String _FORGOT_PASSWORD_URL =
      "http://nardlibrary.org/api/User/ForgotPassword";
  static const String _CHANAGE_PASSWORD_URL =
      "http://nardlibrary.org/api/User/ChangePassword";
  final Map<String, String> _headers = {
    "Accept": "application/json",
    'Content-Type': 'application/json; charset=UTF-8'
  };

  WebApiImpl._internal();
  static final WebApiImpl _instance = WebApiImpl._internal();
  static get instance => _instance;

  @override
  Future<AuthResponse?> login(String username, String password) async {
    AuthResponse? loginResponse;
    Response response = await post(Uri.parse(_LOGIN_URL),
        headers: _headers,
        body: jsonEncode(
            <String, String>{"Username": username, "Password": password}));

    if (response.statusCode == 200) {
      loginResponse = AuthResponse.fromJson(jsonDecode(response.body));
      return loginResponse;
    } else {
      print(response.body);
      return AuthResponse(FAILED, "", "");
    }
  }

  @override
  Future<AuthResponse?> SignUpUser(UserInfo info) async {
    AuthResponse? signUpResponse;
    Response response = await post(
      Uri.parse(_SIGN_UP_URL),
      headers: _headers,
      body: jsonEncode(
        <String, String>{
          "Username": info.userName!,
          "Password": info.password!,
          "Address": info.address,
          "CommencementYear": info.commencementYear,
          "Department": info.department,
          "Designation": info.department,
          "DOB": info.dob,
          "Email": info.email,
          "Firstname": info.firstName,
          "Folio": info.folio!,
          "Gender": info.gender,
          "Institution": info.institution,
          "Othernames": info.otherNames,
          "Phone": info.phone,
          "Role": info.role,
          "State": info.state,
          "Surname": info.surname
        },
      ),
    );

    if (response.statusCode == 200) {
      signUpResponse = AuthResponse.fromJson(jsonDecode(response.body));
      return signUpResponse;
    } else {
      print(response.body);
      return AuthResponse(FAILED, "", "");
    }
  }

  @override
  Future<AuthResponse?> changePassword(
      String userName, String password, String newPassword) async {
    AuthResponse? changePwdResponse;
    Response response = await post(Uri.parse(_CHANAGE_PASSWORD_URL),
        headers: _headers,
        body: jsonEncode(<String, String>{
          "Username": userName,
          "Password": password,
          "NewPassword": newPassword
        }));

    if (response.statusCode == 200) {
      changePwdResponse = AuthResponse.fromJson(jsonDecode(response.body));
      return changePwdResponse;
    } else {
      print("Printint Error response" + response.body);
      return AuthResponse(FAILED, "", "");
    }
  }

  @override
  Future<AuthResponse?> forgotPassword(String userName) async {
    AuthResponse? forgotPwdResponse;
    Response response = await post(Uri.parse(_FORGOT_PASSWORD_URL),
        headers: _headers,
        body: jsonEncode(<String, String>{"Username": userName}));

    if (response.statusCode == 200) {
      forgotPwdResponse = AuthResponse.fromJson(jsonDecode(response.body));
      return forgotPwdResponse;
    } else {
      print("Prinitng error response" + response.body);
      return AuthResponse(FAILED, "", "");
    }
  }
}
