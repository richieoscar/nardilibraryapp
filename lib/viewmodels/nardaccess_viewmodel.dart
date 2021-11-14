import 'package:flutter/foundation.dart';

class NardViewmodel extends ChangeNotifier {
  bool _swapScreen = false;
  bool get swap => _swapScreen;

  void swapSignUp() {
    _swapScreen = true;
    notifyListeners();
  }
  void swapLogin(){
_swapScreen = false;
    notifyListeners();
  }
}
