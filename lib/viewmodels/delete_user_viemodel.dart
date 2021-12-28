import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/service/auth/auth_service.dart';
import 'package:nardilibraryapp/service/auth/auth_service_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/util/utils.dart';

class DeleteUserViewmodel extends ChangeNotifier {
  final AuthService _service = AuthServiceImpl.instance;
  BookResourceService _bookService = BookResourceImpl.instance;
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

  void deleteResource(int id, BuildContext context) async {
    bool? response = await _bookService.deleteAResource(id, context);

    if (response!) {
      AppUtils.showSnackBar(context, "Resource Deleted");
      print(response);
      isVisible = false;
    }

    if (!response) {
      isVisible = false;
      AppUtils.showSnackBar(context, "Resource Does not Exist");
    }
  }

  void addDepartment(String name, BuildContext context) async {
    isVisible = true;
    notifyListeners();
    bool isAdded = await _bookService.addDepartment(name, context);
    if (isAdded) {
      AppUtils.showSnackBar(context, "Department Added");
      print(isAdded);
      isVisible = false;
    }
    if (!isAdded) {
      AppUtils.showSnackBar(
          context, "Department could not be added, Try again");
      print(isAdded);
      isVisible = false;
    }
  }
}
