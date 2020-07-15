import 'package:cross_connectivity/cross_connectivity.dart';

abstract class ConnectivityAdapter {
  Future<bool> get isConnected;
}

class ConnectivityAdapterImpl implements ConnectivityAdapter {
  Connectivity connectivity;

  @override
  Future<bool> get isConnected => connectivity.checkConnection();
}
