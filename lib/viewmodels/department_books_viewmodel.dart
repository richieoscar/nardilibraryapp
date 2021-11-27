import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/util/logger.dart';
import 'package:nardilibraryapp/util/utils.dart';

class DepartmentBooksViewmodel extends ChangeNotifier {
  final BookResourceService _bookResourceService = BookResourceImpl.instance;
  final NavigationService _navigationService = NavigationServiceImpl.instance;
  AppLogger logger = AppLogger();

  List<Book> _departmentBooks = [];
  bool _isLoading = false;
  int? _lenght;
  int? _departmentId;

  // DepartmentBooksViewmodel() {
  //   if (_departmentId == null) {
  //     //
  //   } else {
  //     logger.logInfo("inside elsse block");
  //     getBooksByDepartment(id);
  //   }
  // }

  get isLoading => _isLoading;

  get lenght => _lenght!;

  get id => _departmentId!;

  set departmentId(int? value) {
    _departmentId = value;
    notifyListeners();
  }

  get departmentBooks => _departmentBooks;

  void getBooksByDepartment(BuildContext context, int id) async {
    _isLoading = true;
    notifyListeners();
    ResourceResponse? resource =
        await _bookResourceService.getBooksByDepartment(id);

    if (resource!.status == SUCCESS) {
      _departmentBooks = resource.books!;
      _lenght = _departmentBooks.length;
      if (_lenght == 0) {
        _isLoading = false;
        notifyListeners();
        AppUtils.showSnackBar(context, "No books Available");
      }

      if (_lenght! > 0) {
        _isLoading = false;
        notifyListeners();
      }
      logger.logInfo("INSIDE getBooksByepartment");
      logger.logInfo(id.toString());
      logger.logInfo(_departmentBooks.toString());

      logger.logInfo(_lenght.toString() + "size");
    }
    if (resource.status == FAILED) {
      AppUtils.showSnackBar(context, "Could not load Books at this time");
      _isLoading = false;
    }
  }
}
