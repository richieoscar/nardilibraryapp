

import 'dart:io';

abstract class PdfApi {
  Future<File?> loadFromNetwork(String url);
 

}
