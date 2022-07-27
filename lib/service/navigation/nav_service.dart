import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/model/bookresource/department.dart';
import 'package:nardilibraryapp/ui/views/all_departments.dart';
import 'package:nardilibraryapp/ui/views/department_book.dart';

abstract class NavigationService {
  void navigate(String route, BuildContext context);
  void navigateToBooksFromDepartment(
      String route, BuildContext context, int id);

  void navigateUntil(String route, BuildContext context);

  void navigateAddStack(String route, BuildContext context);

  void pop(BuildContext context);
}
