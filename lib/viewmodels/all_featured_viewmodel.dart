import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/util/logger.dart';

class AllFeaturedViewmodel extends ChangeNotifier {
  final BookResourceService _bookResourceService = BookResourceImpl.instance;
  final NavigationService _navigationService = NavigationServiceImpl.instance;
  AppLogger logger = AppLogger();

  List<Book> _featuredBooks = [];

  int _lenght = 0;

  get lenght => _lenght;

  get featuredBooks => _featuredBooks;

  bool isLoading = true;

  void getFeaturedBooks() async {
    ResourceResponse? resourceResponse =
        await _bookResourceService.getFeaturedBooks();

    if (resourceResponse!.status == SUCCESS) {
      logger.logInfo("HomepAgeViemodel: books");
      logger.logInfo(featuredBooks.toString());
      _featuredBooks = resourceResponse.books!;
      _lenght = _featuredBooks.length;
      isLoading = false;
      notifyListeners();
    }
  }
}
