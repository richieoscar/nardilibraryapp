import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/auth/auth_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/util/utils.dart';

class DeleteUserViewmodel extends ChangeNotifier {
  final AuthService _service = AuthServiceImpl.instance;
  final StorageService _storageService = StorageServiceImpl.instance;
  bool _isVisible = false;

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  void deleteUser(String email, BuildContext context) async {
    AuthResponse? response = await _service.deletUser(email, context);

    if (response != null) {
      if (response.status == "success") {
        AppUtils.showSnackBar(context, "User Deleted");
        print(email);
        isVisible = false;
      }

      if (response.status == "failed") {
        isVisible = false;
         AppUtils.showSnackBar(context, "User Does not Exist");
      }
    }
  }
}
