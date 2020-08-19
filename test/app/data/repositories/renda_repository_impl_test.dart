import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/renda_api.dart';
import 'package:syshouse/app/data/models/renda_model.dart';
import 'package:syshouse/app/data/repositories/renda_repository_impl.dart';
import 'package:syshouse/app/domain/entities/renda.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockRendaApi extends Mock implements RendaApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockRendaApi mockRendaApi;
  RendaRepositoryImpl rendaRepositoryImpl;
  RendaModel rendaModel;
  Renda renda;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockRendaApi = MockRendaApi();

    rendaModel = RendaModel(
      id: "",
    );

    renda = rendaModel;

    rendaRepositoryImpl = RendaRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      rendaApi: mockRendaApi,
    );
  });

  void mockRendaApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockRendaApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockRendaApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockRendaApi.find(any)).thenAnswer((_) async => rendaModel);
        var result = await rendaRepositoryImpl.findRenda(param);
        expect(result.fold((l) => l, (r) => r), isA<RendaModel>());
      });

      test('throws serverFailure', () async {
        when(mockRendaApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await rendaRepositoryImpl.findRenda(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockRendaApi.list()).thenAnswer((_) async => [rendaModel]);

        var result = await rendaRepositoryImpl.listRenda();

        expect(result.fold((l) => l, (r) => r), isA<List<RendaModel>>());
      });

      test('throws serverFailure', () async {
        when(mockRendaApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await rendaRepositoryImpl.listRenda();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockRendaApi.listPage(page, size))
            .thenAnswer((_) async => [rendaModel]);

        var result = await rendaRepositoryImpl.listPageRenda(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<RendaModel>>());
      });

      test('throws serverFailure', () async {
        when(mockRendaApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await rendaRepositoryImpl.listPageRenda(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockRendaApi.delete(param)).thenAnswer((_) async => rendaModel);

        await rendaRepositoryImpl.deleteRenda(param);

        verify(rendaRepositoryImpl.rendaApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockRendaApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await rendaRepositoryImpl.deleteRenda(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockRendaApi.save(any)).thenAnswer((_) async => rendaModel);

        var result = await rendaRepositoryImpl.saveRenda(renda);

        expect(result.fold((l) => l, (r) => r), rendaModel);
      });

      test('throws serverFailure', () async {
        when(mockRendaApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await rendaRepositoryImpl.saveRenda(renda);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockRendaApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockRendaApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await rendaRepositoryImpl.findRenda(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockRendaApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await rendaRepositoryImpl.listRenda();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockRendaApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await rendaRepositoryImpl.listPageRenda(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockRendaApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await rendaRepositoryImpl.deleteRenda(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockRendaApi.save(renda))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await rendaRepositoryImpl.saveRenda(Renda());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
