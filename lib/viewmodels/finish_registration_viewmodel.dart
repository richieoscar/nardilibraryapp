import 'package:flutter/cupertino.dart';
import 'package:nardilibraryapp/service/navigation/nav_service.dart';
import 'package:nardilibraryapp/service/navigation/nav_service_impl.dart';

class FinishRegistrationViewmodel extends ChangeNotifier {
  NavigationService _navigationService = NavigationServiceImpl.instance;

  void navigateUntil(String route, BuildContext context) {
    _navigationService.navigateUntil(route, context);
  }
}
