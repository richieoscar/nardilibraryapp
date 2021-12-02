import 'dart:io';

import 'package:http/http.dart';
import 'package:nardilibraryapp/service/wep_api/pdf_api.dart';
import 'package:nardilibraryapp/util/utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PDFApiImpl extends PdfApi {

  PDFApiImpl._internal();
  static final PDFApiImpl _instance = PDFApiImpl._internal();
  static get instance => _instance;

  @override
  Future<File?> loadFromNetwork(String url) async {
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      return _storeFile(url, bytes);
    } else {
      print("COuld not load pdf");
      return null;
    }
  }

  Future<File?> _storeFile(String url, List<int> bytes) async {
    File? file;
    String fileName = basename(url);
    final Directory dir = await getApplicationDocumentsDirectory();
    file = File('${dir.path}/$fileName');
    await file.writeAsBytes(bytes);
    return file;
  }
}
