import 'package:cross_connectivity/cross_connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final NetworkInfoImplAdapter networkInfoImplAdapter;

  NetworkInfoImpl(this.networkInfoImplAdapter);

  @override
  Future<bool> get isConnected => networkInfoImplAdapter.checkConnection;
}

class NetworkInfoImplAdapter {
  Connectivity _connectivity;

  Future<bool> get checkConnection => _connectivity.checkConnection();
}
