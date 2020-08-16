import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api.dart';
import 'package:syshouse/app/data/repositories/contato_repository_impl.dart';
import 'package:syshouse/app/domain/entities/contato.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockDatasourcesApi extends Mock implements DatasourcesApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  ContatoRepositoryImpl contatoRepositoryImpl;
  MockDatasourcesApi mockDatasourcesApi;
  MockConnectivityAdapter mockConnectivityAdapter;
  var param = "1";

  setUp(() {
    mockDatasourcesApi = MockDatasourcesApi();
    mockConnectivityAdapter = MockConnectivityAdapter();
    contatoRepositoryImpl = ContatoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      datasourcesApi: mockDatasourcesApi,
    );
  });

  void mockDatasourcesApiConnected() {
    when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
  }

  void mockDatasourcesApiDisconnected() {
    when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
  }

  void mockFind() {
    when(mockDatasourcesApi.find(any)).thenAnswer((_) async => Contato());
  }

  test('should return value without error', () async {
    mockDatasourcesApiConnected();
    mockFind();
    var result = await contatoRepositoryImpl.findContato(param);

    expect(result | null, isA<Contato>());
  });
}
