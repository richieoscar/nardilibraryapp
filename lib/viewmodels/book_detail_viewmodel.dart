import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/bookresource/book_response.dart';
import 'package:nardilibraryapp/model/shelf/shelf_response.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';
import 'package:nardilibraryapp/util/logger.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:nardilibraryapp/model/shelf/add_to_shelf.dart';

class BookDetailViewmodel extends ChangeNotifier {
  final BookResourceService _bookResourceService = BookResourceImpl.instance;
  final StorageService _storageService = StorageServiceImpl.instance;
  AppLogger logger = AppLogger();

  Book? _book;
  bool _isLoading = true;
  File? _file;
  String? _filePath;

  get filePath => _filePath!;

  get isLoading => _isLoading;
  get book => _book!;

  Future getBooksResourceById(BuildContext context, int id) async {
    _isLoading = true;
    //   notifyListeners();
    BookResourceResponse? resource =
        await _bookResourceService.getBookResourceById(id);

    if (resource!.getStatus == SUCCESS) {
      _book = resource.getBook;
      _isLoading = false;
      notifyListeners();
      logger.logInfo("INSIDE getBooksResourceBy ID");
      logger.logInfo(id.toString());
      logger.logInfo(book.toString());
    }

    if (resource.getStatus == FAILED) {
      _isLoading = false;
      notifyListeners();
      AppUtils.showSnackBar(context, "Oops!, Could not load book at this time");
    }
  }

  Future getPDF(String url) async {
    _file = await _bookResourceService.getPDF(url);
    notifyListeners();
    return _file!;
  }

  void addToShelf(AddToShelf shelf, BuildContext context) async {
    ShelfResponse? response =
        await _bookResourceService.addToShelf(shelf);

    if (response!.status == SUCCESS) {
      AppUtils.showSnackBar(context, "Book Added to your shelf");
    }
     if (response!.status == "ALREADY_IN_SHELF") {
      AppUtils.showSnackBar(context, "Book Already in shelf");
    }
    if (response!.status == FAILED) {
      AppUtils.showSnackBar(context, "Failed to add book to your shelf");
    }
  }

  String? username() {
    return _storageService.getUserName();
  }
}
