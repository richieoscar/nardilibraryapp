import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConection {
  static Connectivity? _connectivity;
  static ConnectivityResult? _result;
  static bool? _isConnected;

  static Future<void> initializeConnection() async {
    _connectivity = Connectivity();
  }

  static Future<bool?> checkNetworkConnection() async {
    _result = await _connectivity!.checkConnectivity();
    if (_result == ConnectivityResult.none) {
      return _isConnected = false;
    }
    if (_result == ConnectivityResult.mobile ||
        _result == ConnectivityResult.wifi) {
      return _isConnected = true;
    }
  }
}
