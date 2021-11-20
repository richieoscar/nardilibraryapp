import 'package:flutter/cupertino.dart';

abstract class NavigationService {
  void navigate(String route, BuildContext context);

  void navigateUntil(String route, BuildContext context);

  void navigateAddStack(String route, BuildContext context);
}
