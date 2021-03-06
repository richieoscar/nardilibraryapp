import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/model/bookresource/book_response.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/model/bookresource/search_request.dart';
import 'package:nardilibraryapp/model/shelf/add_to_shelf.dart';
import 'package:nardilibraryapp/model/shelf/shelf_response.dart';

abstract class BookResourceService {
  Future<ResourceResponse?> getFeaturedBooks();
  Future<DepartmentResponse?> getDepartments();
  Future<ResourceResponse?> getBooksByDepartment(int id);
  Future<BookResourceResponse?> getBookResourceById(int id);
  Future<ResourceResponse?> searchResources(String request);
  Future<bool> addAResource(BookResource resource);
  Future<File?> getPDF(String url);
  Future<bool?> deleteAResource(int resourceId, BuildContext context);
  Future<bool> addDepartment(String name, BuildContext context);
  Future<ShelfResponse?> addToShelf(AddToShelf shelf);
  Future<ShelfResponse?> removeFromShelf(AddToShelf shelf);
  Future<ShelfResponse?> getShelfBooks(String? username);
}
