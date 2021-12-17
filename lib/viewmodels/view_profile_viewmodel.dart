import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/model/auth/user_response.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/auth/auth_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/util/utils.dart';

class ViewProfileViewmodel extends ChangeNotifier {
  final AuthService _service = AuthServiceImpl.instance;
  final StorageService _storageService = StorageServiceImpl.instance;
  bool isLoading = false;
  UserInfo? user;
  String? email;

  String? emaill() {
    email = _storageService.getEmail();
    notifyListeners();
    return email;
  }

  getUser(String email, BuildContext context) async {
    isLoading = true;
    // notifyListeners();
    UserResponse? response = await _service.getUser(email, context);

    if (response == null) {
      print("Response null herr");
      print(response);
    }

    if (response?.status == SUCCESS) {
      user = response?.userInfo;
      isLoading = false;
      notifyListeners();
    } else {
      AppUtils.showSnackBar(context, "Could not fetch User, Try Again");
    }
  }
}
