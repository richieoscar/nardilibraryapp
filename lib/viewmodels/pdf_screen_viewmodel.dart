import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_impl.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';

class PDFViewmodel extends ChangeNotifier {
  final BookResourceService _bookResourceService = BookResourceImpl.instance;

  
}
