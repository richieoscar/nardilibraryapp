import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/auth/auth_service_impl.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/util/utils.dart';

class VerifyEmailViewmodel extends ChangeNotifier {
  final NavigationService _service = NavigationServiceImpl.instance;
  final AuthService _authService = AuthServiceImpl.instance;
  final StorageService _storageService = StorageServiceImpl.instance;
  bool _isVisible = false;

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  void navigate(String route, BuildContext context) {
    _service.navigate(route, context);
  }

  void resend(BuildContext context) async {
    String? username = _storageService.getUserName();
    AuthResponse? response =
        await _authService.forgotPassword(username!, context);
    if (response!.status == "success") {
      isVisible = false;
      AppUtils.showSnackBar(context, "Resent To Your Email");
    }
  }
}
