import 'package:connectivity_plus/connectivity_plus.dart';

class Connection {
  final Connectivity _connectivity = Connectivity();

  Future<bool> hasMobileConnection() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.mobile;
  }

  Future<bool> hasWifiConnection() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi;
  }

  Future<bool> hasConnection() async {
    return await hasWifiConnection() || await hasMobileConnection();
  }

  Stream<ConnectivityResult> listConnection() {
    return _connectivity.onConnectivityChanged;
  }
}