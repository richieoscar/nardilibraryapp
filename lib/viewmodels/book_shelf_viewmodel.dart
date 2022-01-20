import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/shelf/add_to_shelf.dart';
import 'package:nardilibraryapp/model/shelf/shelf_response.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/util/logger.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookShelfViewmodel extends ChangeNotifier {
  final BookResourceService _bookResourceService = BookResourceImpl.instance;
  final StorageService _storageService = StorageServiceImpl.instance;
  AppLogger logger = AppLogger();

  BookShelfViewmodel() {
    getUsername();
  }

  bool _isLoading = true;
  get getIsLoading => _isLoading;

  set setIsLoading(isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  List<Book>? _shelvedBooks;
  bool _isShelfEmpty = false;
  String? _username = "";
  get username => _username;

  void getUsername() async {
     SharedPreferences pref = await SharedPreferences.getInstance();
    _username = pref.getString("userName") ?? "";
    notifyListeners();
  
   
  }

  get shelvedBooks => _shelvedBooks;

  get isShelfEmpty => _isShelfEmpty;

  void getShelvedBooks() async {
    ShelfResponse? shelfResponse =
        await _bookResourceService.getShelfBooks(_username);

    if (shelfResponse!.status == SUCCESS) {
      _isLoading = false;
      _shelvedBooks = shelfResponse.shelVedBooks;
      notifyListeners();
      if (_shelvedBooks!.isEmpty) {
        _isShelfEmpty = true;
        notifyListeners();
      }
      if (_shelvedBooks!.isNotEmpty) {
        _isShelfEmpty = false;
        notifyListeners();
      }

      logger.logInfo("Inside GetShelved Books");
      print(_shelvedBooks);
    }

    if (shelfResponse.status == FAILED) {
      _isLoading = false;
      notifyListeners();

      logger.logInfo("Inside GetShelved Books");
      print(_shelvedBooks);
    }
  }

  void removeFromShelf(AddToShelf shelf, BuildContext context) async {
    ShelfResponse? shelfResponse =
        await _bookResourceService.removeFromShelf(shelf);

    if (shelfResponse!.status == SUCCESS) {
      _isLoading = false;
      logger.logInfo(shelfResponse.message);
      AppUtils.showSnackBar(context, "Book removed from shelf");
      notifyListeners();
      logger.logInfo("Inside RemovedFromShelved Books");
    }

    if (shelfResponse.status == FAILED) {
      _isLoading = false;
      logger.logError(shelfResponse.message);
      notifyListeners();
      AppUtils.showSnackBar(context, "Failed to removed from shelf");

      logger.logInfo("Inside GetShelved Books Error response");
    }
  }
}
