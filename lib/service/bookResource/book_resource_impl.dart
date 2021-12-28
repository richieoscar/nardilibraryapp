import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/model/bookresource/book_response.dart';
import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/model/bookresource/search_request.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/model/shelf/add_to_shelf.dart';
import 'package:nardilibraryapp/model/shelf/shelf_response.dart';
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

  @override
  Future<bool?> deleteAResource(int resourceId, BuildContext context) async {
    bool? isDeleleted = await _webApi.deleteResource(resourceId, context);
    return isDeleleted;
  }

  @override
  Future<bool> addDepartment(String name, BuildContext context) async {
    bool isAdded = await _webApi.addDepartment(name);
    return isAdded;
  }

  @override
  Future<ShelfResponse?> addToShelf(AddToShelf shelf) async {
    ShelfResponse? response = await _webApi.addToShelf(shelf);
    return response;
  }

  @override
  Future<ShelfResponse?> getShelfBooks(String? username) async {
    ShelfResponse? response = await _webApi.getShelfBooks(username);
    return response;
  }

  @override
  Future<ShelfResponse?> removeFromShelf(AddToShelf shelf)async {
    ShelfResponse? response = await _webApi.removeFromShelf(shelf);
    return response;
  }
}
