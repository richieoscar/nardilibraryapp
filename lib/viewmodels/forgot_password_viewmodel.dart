import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/auth/auth_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';

class ForgotPasswordViewmodel extends ChangeNotifier {
  final AuthService _service = AuthServiceImpl.instance;
  final StorageService _storageService = StorageServiceImpl.instance;
  bool _isVisible = false;

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  void forgotPassword(String username, BuildContext context) async {
    AuthResponse? response = await _service.forgotPassword(username, context);

    if (response != null) {
      if (response.status == "success") {
        _storageService.saveUserName(username);
        print(username);
        isVisible = false;
      }

      if (response.status == "failed") {
        isVisible = false;
      }
    }
  }
}
