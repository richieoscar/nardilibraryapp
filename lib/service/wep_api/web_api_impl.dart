import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/model/bookresource/search_request.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/service/wep_api/web_api.dart';
import 'package:nardilibraryapp/util/logger.dart';

class WebApiImpl implements WebApi {
  static const String _LOGIN_URL = "http://nardlibrary.org/api/User/Login";
  static const String _SIGN_UP_URL = "http://nardlibrary.org/api/User/Register";
  static const String _FORGOT_PASSWORD_URL =
      "http://nardlibrary.org/api/User/ForgotPassword";
  static const String _CHANAGE_PASSWORD_URL =
      "http://nardlibrary.org/api/User/ChangePassword";

  static const String _ADD_RESOURCE_URL =
      "http://nardlibrary.org/api/Resource/Add";
  static const String _GET_RESOURCE_URL =
      "http://nardlibrary.org/api/Resource/Get/";
  static const String _FIND_RESOURCE_URL =
      "http://nardlibrary.org/api/Resource/Find";
  static const String _GET_ALL_DEPARTMENTS_URL =
      "http://nardlibrary.org/api/Department/GetAll";
  static const String _GET_RESOURCE_BY_DEPARTMENT_URL =
      "http://nardlibrary.org/api/Resource/GetByDepartment/";
  static const String _FEATURED_BOOKS_URL =
      "http://nardlibrary.org/api/Resource/Featured";

  final Map<String, String> _headers = {
    "Accept": "application/json",
    'Content-Type': 'application/json; charset=UTF-8'
  };

  WebApiImpl._internal();
  static final WebApiImpl _instance = WebApiImpl._internal();
  static get instance => _instance;

  AppLogger _logger = AppLogger();

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

  @override
  void addAResource(BookResource resource) {
    // TODO: implement addAResource
  }

  @override
  Future<ResourceResponse?> getBookResourceById(int id) {
    // TODO: implement getBookResourceById
    throw UnimplementedError();
  }

  @override
  Future<ResourceResponse?> getBooksByDepartment(int id) async {
    ResourceResponse? departmentBooks;
    _logger.logInfo("Inside getResourceByDepartment()");
    Response response = await get(
      Uri.parse("http://nardlibrary.org/api/Resource/GetByDepartment/$id"),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      _logger.logInfo(response.statusCode.toString());
      _logger.logInfo(response.body);
      departmentBooks = ResourceResponse.fromJson(jsonDecode(response.body));
      print(departmentBooks);
      //_logger.logInfo("FeaturedBooks" + featuredBooks.books);
      return departmentBooks;
    } else {
      return ResourceResponse(FAILED, "", []);
    }
  }

  @override
  Future<DepartmentResponse?> getDepartments() async {
    DepartmentResponse? departments;
    _logger.logInfo("Inside getepartment()");
    Response response = await get(
      Uri.parse(_GET_ALL_DEPARTMENTS_URL),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      _logger.logInfo(response.statusCode.toString());
      _logger.logInfo(response.body);
      departments = DepartmentResponse.fromJson(jsonDecode(response.body));
      print(departments);
      //_logger.logInfo("FeaturedBooks" + featuredBooks.books);
      return departments;
    } else {
      return DepartmentResponse(FAILED, "", []);
    }
  }

  @override
  Future<ResourceResponse?> getFeaturedBooks() async {
    ResourceResponse? featuredBooks;
    _logger.logInfo("Inside getFeaturedBook()");
    Response response = await get(
      Uri.parse(_FEATURED_BOOKS_URL),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      _logger.logInfo(response.statusCode.toString());
      _logger.logInfo(response.body);
      featuredBooks = ResourceResponse.fromJson(jsonDecode(response.body));
      print(featuredBooks);
      //_logger.logInfo("FeaturedBooks" + featuredBooks.books);
      return featuredBooks;
    } else {
      return ResourceResponse(FAILED, "", []);
    }
  }

  @override
  Future<ResourceResponse> searchResources(SearchRequest request) {
    // TODO: implement searchResources
    throw UnimplementedError();
  }
}
