import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/tipo_renda_api.dart';
import 'package:syshouse/app/data/models/tipo_renda_model.dart';
import 'package:syshouse/app/data/repositories/tipo_renda_repository_impl.dart';
import 'package:syshouse/app/domain/entities/tipo_renda.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockTipoRendaApi extends Mock implements TipoRendaApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockTipoRendaApi mockTipoRendaApi;
  TipoRendaRepositoryImpl tiporendaRepositoryImpl;
  TipoRendaModel tiporendaModel;
  TipoRenda tiporenda;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockTipoRendaApi = MockTipoRendaApi();

    tiporendaModel = TipoRendaModel(
      id: "",
    );

    tiporenda = tiporendaModel;

    tiporendaRepositoryImpl = TipoRendaRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      tiporendaApi: mockTipoRendaApi,
    );
  });

  void mockTipoRendaApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockTipoRendaApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockTipoRendaApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockTipoRendaApi.find(any))
            .thenAnswer((_) async => tiporendaModel);
        var result = await tiporendaRepositoryImpl.findTipoRenda(param);
        expect(result.fold((l) => l, (r) => r), isA<TipoRendaModel>());
      });

      test('throws serverFailure', () async {
        when(mockTipoRendaApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tiporendaRepositoryImpl.findTipoRenda(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockTipoRendaApi.list()).thenAnswer((_) async => [tiporendaModel]);

        var result = await tiporendaRepositoryImpl.listTipoRenda();

        expect(result.fold((l) => l, (r) => r), isA<List<TipoRendaModel>>());
      });

      test('throws serverFailure', () async {
        when(mockTipoRendaApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tiporendaRepositoryImpl.listTipoRenda();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockTipoRendaApi.listPage(page, size))
            .thenAnswer((_) async => [tiporendaModel]);

        var result =
            await tiporendaRepositoryImpl.listPageTipoRenda(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<TipoRendaModel>>());
      });

      test('throws serverFailure', () async {
        when(mockTipoRendaApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await tiporendaRepositoryImpl.listPageTipoRenda(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockTipoRendaApi.delete(param))
            .thenAnswer((_) async => tiporendaModel);

        await tiporendaRepositoryImpl.deleteTipoRenda(param);

        verify(tiporendaRepositoryImpl.tiporendaApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockTipoRendaApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tiporendaRepositoryImpl.deleteTipoRenda(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockTipoRendaApi.save(any))
            .thenAnswer((_) async => tiporendaModel);

        var result = await tiporendaRepositoryImpl.saveTipoRenda(tiporenda);

        expect(result.fold((l) => l, (r) => r), tiporendaModel);
      });

      test('throws serverFailure', () async {
        when(mockTipoRendaApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tiporendaRepositoryImpl.saveTipoRenda(tiporenda);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockTipoRendaApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockTipoRendaApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tiporendaRepositoryImpl.findTipoRenda(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockTipoRendaApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tiporendaRepositoryImpl.listTipoRenda();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockTipoRendaApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await tiporendaRepositoryImpl.listPageTipoRenda(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockTipoRendaApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tiporendaRepositoryImpl.deleteTipoRenda(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockTipoRendaApi.save(tiporenda))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tiporendaRepositoryImpl.saveTipoRenda(TipoRenda());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
