import 'package:flutter/foundation.dart';
import 'package:nardilibraryapp/service/storage/storage_service.dart';
import 'package:nardilibraryapp/service/storage/storage_service_impl.dart';

class SplashViewmodel extends ChangeNotifier {
  StorageService _storageService = StorageServiceImpl.instance;

  SplashViewmodel() {
    // getKeepedMeLoggedin();
    // getUserRole();cls

  }

  bool? _isLoggedIn;
  get isLoggedIn => _isLoggedIn;

  String? _role;
  String? get getRole => _role;

  void getKeepedMeLoggedin() async {
    _isLoggedIn = await _storageService.getKeepMeLoggedIn();
    notifyListeners();
  }

 
}
