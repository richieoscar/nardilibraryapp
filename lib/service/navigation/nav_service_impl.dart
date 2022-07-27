import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/ui/views/all_departments.dart';
import 'package:nardilibraryapp/ui/views/department_book.dart';

class NavigationServiceImpl implements NavigationService {
  NavigationServiceImpl._internal();
  static NavigationServiceImpl _instance = NavigationServiceImpl._internal();
  static get instance => _instance;

  @override
  void navigate(String route, BuildContext context) {
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  void navigateUntil(String route, BuildContext context) {
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  void navigateAddStack(String route, BuildContext context) {
    Navigator.pushNamed(context, route);
  }

  @override
  void navigateToBooksFromDepartment(
      String route, BuildContext context, int id) {
    Navigator.pushNamed(context, route, arguments: int);
  }

  @override
  void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
