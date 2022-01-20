import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConection {
  static ConnectivityResult _result = ConnectivityResult.none;
  static final Connectivity _connectivity = Connectivity();
  static late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  static Future<void> initializeConnection() async {
    _result = await _connectivity.checkConnectivity();
  }

  static void onConnectionChanged() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      checkNetworkConnection();
    });
  }

  static void cancelSubscription() {
    _connectivitySubscription.cancel();
  }

  static bool checkNetworkConnection() {
    if (_result == ConnectivityResult.mobile ||
        _result == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
