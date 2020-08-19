import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/despesa_api.dart';
import 'package:syshouse/app/data/models/despesa_model.dart';
import 'package:syshouse/app/data/repositories/despesa_repository_impl.dart';
import 'package:syshouse/app/domain/entities/despesa.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockDespesaApi extends Mock implements DespesaApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockDespesaApi mockDespesaApi;
  DespesaRepositoryImpl despesaRepositoryImpl;
  DespesaModel despesaModel;
  Despesa despesa;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockDespesaApi = MockDespesaApi();

    despesaModel = DespesaModel(
      id: "",
    );

    despesa = despesaModel;

    despesaRepositoryImpl = DespesaRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      despesaApi: mockDespesaApi,
    );
  });

  void mockDespesaApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockDespesaApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockDespesaApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockDespesaApi.find(any)).thenAnswer((_) async => despesaModel);
        var result = await despesaRepositoryImpl.findDespesa(param);
        expect(result.fold((l) => l, (r) => r), isA<DespesaModel>());
      });

      test('throws serverFailure', () async {
        when(mockDespesaApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await despesaRepositoryImpl.findDespesa(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockDespesaApi.list()).thenAnswer((_) async => [despesaModel]);

        var result = await despesaRepositoryImpl.listDespesa();

        expect(result.fold((l) => l, (r) => r), isA<List<DespesaModel>>());
      });

      test('throws serverFailure', () async {
        when(mockDespesaApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await despesaRepositoryImpl.listDespesa();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockDespesaApi.listPage(page, size))
            .thenAnswer((_) async => [despesaModel]);

        var result = await despesaRepositoryImpl.listPageDespesa(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<DespesaModel>>());
      });

      test('throws serverFailure', () async {
        when(mockDespesaApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await despesaRepositoryImpl.listPageDespesa(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockDespesaApi.delete(param))
            .thenAnswer((_) async => despesaModel);

        await despesaRepositoryImpl.deleteDespesa(param);

        verify(despesaRepositoryImpl.despesaApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockDespesaApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await despesaRepositoryImpl.deleteDespesa(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockDespesaApi.save(any)).thenAnswer((_) async => despesaModel);

        var result = await despesaRepositoryImpl.saveDespesa(despesa);

        expect(result.fold((l) => l, (r) => r), despesaModel);
      });

      test('throws serverFailure', () async {
        when(mockDespesaApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await despesaRepositoryImpl.saveDespesa(despesa);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockDespesaApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockDespesaApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await despesaRepositoryImpl.findDespesa(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockDespesaApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await despesaRepositoryImpl.listDespesa();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockDespesaApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await despesaRepositoryImpl.listPageDespesa(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockDespesaApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await despesaRepositoryImpl.deleteDespesa(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockDespesaApi.save(despesa))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await despesaRepositoryImpl.saveDespesa(Despesa());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
