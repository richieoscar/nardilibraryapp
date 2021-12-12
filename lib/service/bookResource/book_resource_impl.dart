import 'dart:async';
import 'dart:io';

import 'package:nardilibraryapp/model/bookresource/book_response.dart';
import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/model/bookresource/search_request.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/service/bookResource/book_resource_service.dart';
import 'package:nardilibraryapp/service/wep_api/pdf_api.dart';
import 'package:nardilibraryapp/service/wep_api/pdf_api_impl.dart';
import 'package:nardilibraryapp/service/wep_api/web_api.dart';
import 'package:nardilibraryapp/service/wep_api/web_api_impl.dart';

class BookResourceImpl extends BookResourceService {
  BookResourceImpl._internal();
  static final BookResourceImpl _instance = BookResourceImpl._internal();
  static get instance => _instance;

  final WebApi _webApi = WebApiImpl.instance;
  final PdfApi _pdfApi = PDFApiImpl.instance;

  @override
  Future<bool> addAResource(BookResource resource) async {
    bool isSuccessful = await _webApi.addAResource(resource);
    return isSuccessful;
  }

  @override
  Future<BookResourceResponse?> getBookResourceById(int id) async {
    BookResourceResponse? bookResponse = await _webApi.getBookResourceById(id);
    return bookResponse;
  }

  @override
  Future<ResourceResponse?> getBooksByDepartment(int id) async {
    ResourceResponse? resourceResponse = await _webApi.getBooksByDepartment(id);
    return resourceResponse!;
  }

  @override
  Future<DepartmentResponse> getDepartments() async {
    DepartmentResponse? departmentResponse = await _webApi.getDepartments();
    return departmentResponse!;
  }

  @override
  Future<ResourceResponse?> getFeaturedBooks() async {
    ResourceResponse? resourceResponse = await _webApi.getFeaturedBooks();
    return resourceResponse!;
  }

  @override
  Future<ResourceResponse?> searchResources(String request) async {
    ResourceResponse? resourceResponse = await _webApi.searchResources(request);
    return resourceResponse!;
  }

  @override
  Future<File?> getPDF(String url) async {
    File? file = await _pdfApi.loadFromNetwork(url);
    return file!;
  }
}
