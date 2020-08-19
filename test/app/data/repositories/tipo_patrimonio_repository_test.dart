import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/tipo_patrimonio_api.dart';
import 'package:syshouse/app/data/models/tipo_patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/tipo_patrimonio_repository_impl.dart';
import 'package:syshouse/app/domain/entities/tipo_patrimonio.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockTipoPatrimonioApi extends Mock implements TipoPatrimonioApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockTipoPatrimonioApi mockTipoPatrimonioApi;
  TipoPatrimonioRepositoryImpl tipopatrimonioRepositoryImpl;
  TipoPatrimonioModel tipopatrimonioModel;
  TipoPatrimonio tipopatrimonio;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockTipoPatrimonioApi = MockTipoPatrimonioApi();

    tipopatrimonioModel = TipoPatrimonioModel(
      id: "",
    );

    tipopatrimonio = tipopatrimonioModel;

    tipopatrimonioRepositoryImpl = TipoPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      tipopatrimonioApi: mockTipoPatrimonioApi,
    );
  });

  void mockTipoPatrimonioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockTipoPatrimonioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockTipoPatrimonioApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockTipoPatrimonioApi.find(any))
            .thenAnswer((_) async => tipopatrimonioModel);
        var result =
            await tipopatrimonioRepositoryImpl.findTipoPatrimonio(param);
        expect(result.fold((l) => l, (r) => r), isA<TipoPatrimonioModel>());
      });

      test('throws serverFailure', () async {
        when(mockTipoPatrimonioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await tipopatrimonioRepositoryImpl.findTipoPatrimonio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockTipoPatrimonioApi.list())
            .thenAnswer((_) async => [tipopatrimonioModel]);

        var result = await tipopatrimonioRepositoryImpl.listTipoPatrimonio();

        expect(
            result.fold((l) => l, (r) => r), isA<List<TipoPatrimonioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockTipoPatrimonioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipopatrimonioRepositoryImpl.listTipoPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockTipoPatrimonioApi.listPage(page, size))
            .thenAnswer((_) async => [tipopatrimonioModel]);

        var result = await tipopatrimonioRepositoryImpl.listPageTipoPatrimonio(
            page, size);

        expect(
            result.fold((l) => l, (r) => r), isA<List<TipoPatrimonioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockTipoPatrimonioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipopatrimonioRepositoryImpl.listPageTipoPatrimonio(
            page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockTipoPatrimonioApi.delete(param))
            .thenAnswer((_) async => tipopatrimonioModel);

        await tipopatrimonioRepositoryImpl.deleteTipoPatrimonio(param);

        verify(tipopatrimonioRepositoryImpl.tipopatrimonioApi.delete(param))
            .called(1);
      });

      test('throws serverFailure', () async {
        when(mockTipoPatrimonioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await tipopatrimonioRepositoryImpl.deleteTipoPatrimonio(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockTipoPatrimonioApi.save(any))
            .thenAnswer((_) async => tipopatrimonioModel);

        var result = await tipopatrimonioRepositoryImpl
            .saveTipoPatrimonio(tipopatrimonio);

        expect(result.fold((l) => l, (r) => r), tipopatrimonioModel);
      });

      test('throws serverFailure', () async {
        when(mockTipoPatrimonioApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipopatrimonioRepositoryImpl
            .saveTipoPatrimonio(tipopatrimonio);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockTipoPatrimonioApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockTipoPatrimonioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await tipopatrimonioRepositoryImpl.findTipoPatrimonio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockTipoPatrimonioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipopatrimonioRepositoryImpl.listTipoPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockTipoPatrimonioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipopatrimonioRepositoryImpl.listPageTipoPatrimonio(
            page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockTipoPatrimonioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await tipopatrimonioRepositoryImpl.deleteTipoPatrimonio(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockTipoPatrimonioApi.save(tipopatrimonio))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipopatrimonioRepositoryImpl
            .saveTipoPatrimonio(TipoPatrimonio());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
