import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/model/auth/user_response.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/model/bookresource/book_response.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/model/bookresource/search_request.dart';
import 'package:nardilibraryapp/model/shelf/add_to_shelf.dart';
import 'package:nardilibraryapp/model/shelf/shelf_response.dart';
import 'package:nardilibraryapp/model/unit.dart';

abstract class WebApi {
  Future<AuthResponse?> login(String username, String password);
  Future<AuthResponse?> forgotPassword(String userName);
  Future<AuthResponse?> changePassword(
      String userName, String password, String newPassword);
  Future<AuthResponse?> SignUpUser(UserInfo info);
  Future<AuthResponse?> deleteUser(String email);
  Future<UserResponse?> getUser(String email);
  Future<UserResponse?> updateUser(UserInfo info);

  Future<ResourceResponse?> getFeaturedBooks();
  Future<DepartmentResponse?> getDepartments();
  Future<ResourceResponse?> getBooksByDepartment(int id);
  Future<BookResourceResponse?> getBookResourceById(int id);
  Future<ResourceResponse?> searchResources(String request);
  Future<bool> addAResource(BookResource? resource);
  Future<ResourceResponse?> getHistory();
  Future<ShelfResponse?> addToShelf(AddToShelf shelfData);
  Future<ShelfResponse?> removeFromShelf(AddToShelf shelfData);
  Future<ShelfResponse?> getShelfBooks(String? username);
  Future<bool> addDepartment(String? department);
  Future<bool> addUnit(Unit? unit);
  Future<bool?> deleteResource(int? id, BuildContext context);
}
