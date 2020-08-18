import 'package:mockito/mockito.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

// class MockDatasourcesApi extends Mock implements DataSourcea {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  // ContatoRepositoryImpl contatoRepositoryImpl;
  // MockDatasourcesApi mockDatasourcesApi;
  // MockConnectivityAdapter mockConnectivityAdapter;
  // var param = "1";
  // var page = 1;
  // var size = 1;

  // setUp(() {
  //   mockDatasourcesApi = MockDatasourcesApi();
  //   mockConnectivityAdapter = MockConnectivityAdapter();
  //   contatoRepositoryImpl = ContatoRepositoryImpl(
  //     connectivityAdapter: mockConnectivityAdapter,
  //     datasourcesApi: mockDatasourcesApi,
  //   );
  // });

  // void mockDatasourcesApiConnected(Function body) {
  //   group('is Connected', () {
  //     setUp(() {
  //       when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
  //     });
  //     body();
  //   });
  // }

  // void mockDatasourcesApiDisconnected(Function body) {
  //   group('is not Connected', () {
  //     setUp(() {
  //       when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
  //     });
  //     body();
  //   });
  // }

  // mockDatasourcesApiConnected(() {
  //   group('Find', () {
  //     test('no failures', () async {
  //       when(mockDatasourcesApi.find(any)).thenAnswer((_) async => Contato());
  //       var result = await contatoRepositoryImpl.findContato(param);
  //       expect(result.fold((l) => l, (r) => r), isA<Contato>());
  //     });

  //     test('throws serverFailure', () async {
  //       when(mockDatasourcesApi.find(any))
  //           .thenThrow(ServerApiException(error: 'AnyError'));

  //       var result = await contatoRepositoryImpl.findContato(param);

  //       expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
  //     });
  //   });

  //   group('list', () {
  //     test('no failures', () async {
  //       when(mockDatasourcesApi.list()).thenAnswer((_) async => <Contato>[]);

  //       var result = await contatoRepositoryImpl.listContato();

  //       expect(result.fold((l) => l, (r) => r), isA<List<Contato>>());
  //     });

  //     test('throws serverFailure', () async {
  //       when(mockDatasourcesApi.list())
  //           .thenThrow(ServerApiException(error: 'AnyError'));

  //       var result = await contatoRepositoryImpl.listContato();

  //       expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
  //     });
  //   });

  //   group('listPage', () {
  //     test('no failures', () async {
  //       when(mockDatasourcesApi.listPage(page, size))
  //           .thenAnswer((_) async => <Contato>[]);

  //       var result = await contatoRepositoryImpl.listPageContato(page, size);

  //       expect(result.fold((l) => l, (r) => r), isA<List<Contato>>());
  //     });

  //     test('throws serverFailure', () async {
  //       when(mockDatasourcesApi.listPage(page, size))
  //           .thenThrow(ServerApiException(error: 'AnyError'));

  //       var result = await contatoRepositoryImpl.listPageContato(page, size);

  //       expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
  //     });
  //   });

  //   group('delete', () {
  //     test('no failures', () async {
  //       when(mockDatasourcesApi.delete(param)).thenAnswer((_) async => Contato);

  //       var result = await contatoRepositoryImpl.deleteContato(param);

  //       expect(result.fold((l) => l, (r) => r), isA<Contato>());
  //     });

  //     test('throws serverFailure', () async {
  //       when(mockDatasourcesApi.delete(param))
  //           .thenThrow(ServerApiException(error: 'AnyError'));

  //       var result = await contatoRepositoryImpl.deleteContato(param);

  //       expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
  //     });
  //   });
  // });
}
