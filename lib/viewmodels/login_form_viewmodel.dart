import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/auth/auth_service_impl.dart';

class LoginFormViewModel extends ChangeNotifier {
  final AuthService _service = AuthServiceImpl.instance;
  bool _isVisible = false;
  String? _username;
  String? get getUsername => _username;

  set setUsername(String? username) {
    _username = username;
    notifyListeners();
  }

  

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    AuthResponse? response = await _service.loginUser(email, password, context);
    if (response!.status == "success") {
      setUsername = response.message;
      isVisible = false;
    }

    if (response.status == "failed") {
      isVisible = false;
    }
  }
}
