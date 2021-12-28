import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConection {
  static ConnectivityResult _result = ConnectivityResult.none;
  static final Connectivity _connectivity = Connectivity();

  static Future<void> initializeConnection() async {
    _result = await _connectivity.checkConnectivity();
  }

  static bool checkNetworkConnection() {
    if (_result == ConnectivityResult.mobile || _result == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
