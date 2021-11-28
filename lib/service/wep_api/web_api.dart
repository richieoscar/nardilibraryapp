import 'package:nardilibraryapp/model/auth/auth_response.dart';
import 'package:nardilibraryapp/model/auth/user_info.dart';
import 'package:nardilibraryapp/model/bookresource/add_resource.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/model/bookresource/department_response.dart';
import 'package:nardilibraryapp/model/bookresource/resource_response.dart';
import 'package:nardilibraryapp/model/bookresource/search_request.dart';

abstract class WebApi {
  Future<AuthResponse?> login(String username, String password);
  Future<AuthResponse?> forgotPassword(String userName);
  Future<AuthResponse?> changePassword(
      String userName, String password, String newPassword);
  Future<AuthResponse?> SignUpUser(UserInfo info);

  Future<ResourceResponse?> getFeaturedBooks();
  Future<DepartmentResponse?> getDepartments();
  Future<ResourceResponse?> getBooksByDepartment(int id);
  Future<ResourceResponse?> getBookResourceById(int id);
  Future<ResourceResponse?> searchResources(String request);
  void addAResource(BookResource resource);
}
