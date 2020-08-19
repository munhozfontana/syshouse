import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/pagador_api.dart';
import 'package:syshouse/app/data/models/pagador_model.dart';
import 'package:syshouse/app/data/repositories/pagador_repository_impl.dart';
import 'package:syshouse/app/domain/entities/pagador.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockPagadorApi extends Mock implements PagadorApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockPagadorApi mockPagadorApi;
  PagadorRepositoryImpl pagadorRepositoryImpl;
  PagadorModel pagadorModel;
  Pagador pagador;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockPagadorApi = MockPagadorApi();

    pagadorModel = PagadorModel(
      id: "",
    );

    pagador = pagadorModel;

    pagadorRepositoryImpl = PagadorRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      pagadorApi: mockPagadorApi,
    );
  });

  void mockPagadorApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockPagadorApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockPagadorApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockPagadorApi.find(any)).thenAnswer((_) async => pagadorModel);
        var result = await pagadorRepositoryImpl.findPagador(param);
        expect(result.fold((l) => l, (r) => r), isA<PagadorModel>());
      });

      test('throws serverFailure', () async {
        when(mockPagadorApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagadorRepositoryImpl.findPagador(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockPagadorApi.list()).thenAnswer((_) async => [pagadorModel]);

        var result = await pagadorRepositoryImpl.listPagador();

        expect(result.fold((l) => l, (r) => r), isA<List<PagadorModel>>());
      });

      test('throws serverFailure', () async {
        when(mockPagadorApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagadorRepositoryImpl.listPagador();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockPagadorApi.listPage(page, size))
            .thenAnswer((_) async => [pagadorModel]);

        var result = await pagadorRepositoryImpl.listPagePagador(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<PagadorModel>>());
      });

      test('throws serverFailure', () async {
        when(mockPagadorApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagadorRepositoryImpl.listPagePagador(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockPagadorApi.delete(param))
            .thenAnswer((_) async => pagadorModel);

        await pagadorRepositoryImpl.deletePagador(param);

        verify(pagadorRepositoryImpl.pagadorApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockPagadorApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagadorRepositoryImpl.deletePagador(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockPagadorApi.save(any)).thenAnswer((_) async => pagadorModel);

        var result = await pagadorRepositoryImpl.savePagador(pagador);

        expect(result.fold((l) => l, (r) => r), pagadorModel);
      });

      test('throws serverFailure', () async {
        when(mockPagadorApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagadorRepositoryImpl.savePagador(pagador);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockPagadorApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockPagadorApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagadorRepositoryImpl.findPagador(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockPagadorApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagadorRepositoryImpl.listPagador();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockPagadorApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagadorRepositoryImpl.listPagePagador(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockPagadorApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagadorRepositoryImpl.deletePagador(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockPagadorApi.save(pagador))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagadorRepositoryImpl.savePagador(Pagador());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
