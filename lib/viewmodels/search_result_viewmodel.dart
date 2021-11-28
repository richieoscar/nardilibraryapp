import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/util/logger.dart';
import 'package:nardilibraryapp/util/utils.dart';

class SearchResultViewmodel extends ChangeNotifier {
  final StorageService _storageService = StorageServiceImpl.instance;
  final BookResourceService _bookResourceService = BookResourceImpl.instance;
  final NavigationService _navigationService = NavigationServiceImpl.instance;
  AppLogger logger = AppLogger();

  List<Book> _searchQueryList = [];
  get searchQueryList => _searchQueryList;

  int? _searchLenght;
  get searchLenght => _searchLenght;

  int _EMPTY = 0;
  bool isLoading = false;

  void findResource(BuildContext context, String? query) async {
    isLoading = true;
    notifyListeners();
    ResourceResponse? searchResponse =
        await _bookResourceService.searchResources(query!);

    if (searchResponse!.status == SUCCESS) {
      _searchQueryList = searchResponse.books;
      _searchLenght = _searchQueryList.length;
      if (_searchLenght == _EMPTY) {
        isLoading = false;
        notifyListeners();
        AppUtils.showSnackBar(context, "No results Found");
        logger.logInfo("Search Empty");
      }

      if (_searchLenght! > _EMPTY) {
        isLoading = false;
        notifyListeners();
         logger.logInfo(_searchLenght.toString());
        logger.logInfo("Search succesfull");
      }
    }
  }
}
