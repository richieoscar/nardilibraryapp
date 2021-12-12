import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/ui/views/add_resource.dart';
import 'package:nardilibraryapp/ui/views/all_departments.dart';
import 'package:nardilibraryapp/ui/views/department_book.dart';
import 'package:nardilibraryapp/util/logger.dart';
import 'package:nardilibraryapp/util/utils.dart';

class AllDepartmentsViewmodel extends ChangeNotifier {
  final BookResourceService _bookResourceService = BookResourceImpl.instance;
  final NavigationService _navigationService = NavigationServiceImpl.instance;
  AppLogger logger = AppLogger();

  AllDepartmentsViewmodel() {
    getDepartments();
  }

  List<Department> _departments = [];

  int _lenght = 0;

  get lenght => _lenght;

  get departments => _departments;

  bool isLoading = true;
  bool isVisible = false;

  void getDepartments() async {
    DepartmentResponse? resourceResponse =
        await _bookResourceService.getDepartments();

    if (resourceResponse!.status == SUCCESS) {
      logger.logInfo("HomepAgeViemodel: departments");
      _departments = resourceResponse.department!;
      _lenght = _departments.length;
      logger.logInfo(_departments.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  void addResource(BookResource resource, BuildContext context) async {
    isVisible = true;
    notifyListeners();
    bool resourceResponse = await _bookResourceService.addAResource(resource);

    if (resourceResponse == true) {
      logger.logInfo("HomepAgeViemodel: departments");
      AppUtils.showSnackBar(context, "Upload Successful");
      logger.logInfo(resource.toString());
      print(resource.file);
      print(resource.name);
      print(resource.description);
      print(resource.author);
      print(resource.published);
      print(resource.departmentId);
      isVisible = false;
      notifyListeners();
    } else {
      AppUtils.showSnackBar(context, "Upload Failed!");
      isVisible = false;
      notifyListeners();
    }
  }

  void navigate(String route, BuildContext context, int departmentId) {
    _navigationService.navigateToBooksFromDepartment(
        route, context, departmentId);
  }
}
