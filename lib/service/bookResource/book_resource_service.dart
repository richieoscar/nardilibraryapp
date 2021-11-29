import 'dart:io';

import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/model/bookresource/book_response.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/model/bookresource/search_request.dart';

abstract class BookResourceService {
  Future<ResourceResponse?> getFeaturedBooks();
  Future<DepartmentResponse?> getDepartments();
  Future<ResourceResponse?> getBooksByDepartment(int id);
  Future<BookResourceResponse?> getBookResourceById(int id);
  Future<ResourceResponse?> searchResources(String request);
  void addAResource(BookResource resource);
  Future<File> getPDF(String url);
}
