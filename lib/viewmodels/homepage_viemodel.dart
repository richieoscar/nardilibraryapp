import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/model/bookresource/search_request.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/util/logger.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageViewmodel extends ChangeNotifier {
  final StorageService _storageService = StorageServiceImpl.instance;
  final BookResourceService _bookResourceService = BookResourceImpl.instance;
  final NavigationService _navigationService = NavigationServiceImpl.instance;
  AppLogger logger = AppLogger();

  HomePageViewmodel() {
    getFeaturedBooks();
    getDepartments();
    getRole();
    getUsername();
  }

  List<Book> _featuredBooks = [];

  List<Department> _departments = [];
  List<Department> _popularDepartments = [];
  List<Book> _homeBooks = [];
  String _role = "";
  String _username = "";
  String get username => _username;

  get role => _role;

  get homeBooks => _homeBooks;

  get popularDepartment => _popularDepartments;
  get departments => _departments;
  get featuredBooks => _featuredBooks;
  bool isLoading = true;

  void getUsername() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _username = pref.getString("userName") ?? "";
    notifyListeners();
  }

  getRole() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _role = pref.getString("role") ?? "";
    notifyListeners();
  }

  void getFeaturedBooks() async {
    ResourceResponse? resourceResponse =
        await _bookResourceService.getFeaturedBooks();

    if (resourceResponse!.status == SUCCESS) {
      logger.logInfo("HomepAgeViemodel: books");
      logger.logInfo(featuredBooks.toString());
      _featuredBooks = resourceResponse.books!;
      _homeBooks.add(_featuredBooks[0]);
      _homeBooks.add(_featuredBooks[1]);
      _homeBooks.add(_featuredBooks[2]);
      _homeBooks.add(_featuredBooks[3]);
      isLoading = false;
      notifyListeners();
    }
  }

  void getDepartments() async {
    DepartmentResponse? resourceResponse =
        await _bookResourceService.getDepartments();

    if (resourceResponse!.status == SUCCESS) {
      logger.logInfo("HomepAgeViemodel: departments");
      _departments = resourceResponse.department!;
      _popularDepartments.add(_departments[0]);
      _popularDepartments.add(_departments[1]);
      _popularDepartments.add(_departments[2]);
      _popularDepartments.add(_departments[3]);

      logger.logInfo(_departments.toString());

      isLoading = false;
      notifyListeners();
    }
  }

  void navigate(String route, BuildContext context) {
    _navigationService.navigateAddStack(route, context);
  }
}
