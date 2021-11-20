import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';

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
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }

  @override
  void navigateAddStack(String route, BuildContext context) {
    Navigator.pushNamed(context, route);
  }
}
