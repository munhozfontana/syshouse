import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  ConnectivityAdapterImpl networkInfoImpl;

  setUp(() {
    networkInfoImpl = ConnectivityAdapterImpl();
    networkInfoImpl.connectivity = MockConnectivity();
  });

  Future<bool> makeMockConnectivity() {
    return networkInfoImpl.connectivity.checkConnection();
  }

  test('Should return true when have connection', () {
    final tHasConnectionFuture = Future.value(true);

    when(makeMockConnectivity()).thenAnswer((_) => tHasConnectionFuture);

    final result = networkInfoImpl.isConnected;

    verify(networkInfoImpl.isConnected);
    expect(result, tHasConnectionFuture);
  });
  test('Should return false when have not connection', () {
    final tHasConnectionFuture = Future.value(false);

    when(makeMockConnectivity()).thenAnswer((_) => tHasConnectionFuture);

    final result = networkInfoImpl.isConnected;

    verify(networkInfoImpl.isConnected);
    expect(result, tHasConnectionFuture);
  });
}
