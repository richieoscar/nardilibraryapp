import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/constants/state.dart';
import 'package:nardilibraryapp/model/bookresource/book.dart';
import 'package:nardilibraryapp/model/bookresource/book_response.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';
import 'package:nardilibraryapp/util/logger.dart';
import 'package:nardilibraryapp/util/utils.dart';

class BookDetailViewmodel extends ChangeNotifier {
  final BookResourceService _bookResourceService = BookResourceImpl.instance;
  final NavigationService _navigationService = NavigationServiceImpl.instance;
  AppLogger logger = AppLogger();

  Book? _book;
  bool _isLoading = false;
  File? _file;
  String? _filePath;

  get filePath => _filePath!;

  get isLoading => _isLoading;
  get book => _book!;

  void getBooksResourceById(BuildContext context, int id) async {
    _isLoading = true;
    notifyListeners();
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

  void getPDF(String url) async {
    _file = await _bookResourceService.getPDF(url).whenComplete(() => {
         _filePath = _file!.path,
    notifyListeners()
    });

   
  }
}
