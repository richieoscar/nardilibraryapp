import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/shelf/shelf_response.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/util/logger.dart';

class BookShelfViewmodel extends ChangeNotifier {
  final BookResourceService _bookResourceService = BookResourceImpl.instance;
  final StorageService _storageService = StorageServiceImpl.instance;
  AppLogger logger = AppLogger();

  bool isLoading = true;
  List<Book>? _shelvedBooks;
  bool _isShelfEmpty = false;

  get shelvedBooks => _shelvedBooks;

  get isShelfEmpty => _isShelfEmpty;

  void getShelvedBooks() async {
    ShelfResponse? shelfResponse =
        await _bookResourceService.getShelfBooks(_storageService.getUserName());

    if (shelfResponse!.status == SUCCESS) {
      isLoading = false;
      _shelvedBooks = shelfResponse.shelVedBooks;
      notifyListeners();
      if (_shelvedBooks!.isEmpty) {
        _isShelfEmpty = true;
        notifyListeners();
      }
      logger.logInfo("Inside GetShelved Books");
      print(_shelvedBooks);
    }

    if (shelfResponse!.status == FAILED) {
      isLoading = false;
      notifyListeners();

      logger.logInfo("Inside GetShelved Books");
      print(_shelvedBooks);
    }
  }
}
