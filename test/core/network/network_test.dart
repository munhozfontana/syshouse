import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/core/network/network_info.dart';

class MockNetworkInfoImplAdapter extends Mock
    implements NetworkInfoImplAdapter {}

void main() {
  NetworkInfoImpl networkInfoImpl;
  MockNetworkInfoImplAdapter mockNetworkInfoImplAdapter;

  setUp(() {
    mockNetworkInfoImplAdapter = MockNetworkInfoImplAdapter();
    networkInfoImpl = NetworkInfoImpl(mockNetworkInfoImplAdapter);
  });

  test('Should return true when have connection', () {
    final tHasConnectionFuture = Future.value(true);

    when(networkInfoImpl.isConnected).thenAnswer((_) => tHasConnectionFuture);

    final result = networkInfoImpl.isConnected;

    verify(networkInfoImpl.isConnected);
    expect(result, tHasConnectionFuture);
  });
  test('Should return false when have not connection', () {
    final tHasConnectionFuture = Future.value(false);

    when(networkInfoImpl.isConnected).thenAnswer((_) => tHasConnectionFuture);

    final result = networkInfoImpl.isConnected;

    verify(networkInfoImpl.isConnected);
    expect(result, tHasConnectionFuture);
  });
}
