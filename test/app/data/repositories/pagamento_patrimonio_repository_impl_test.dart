import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/pagamento_patrimonio_api.dart';
import 'package:syshouse/app/data/models/pagamento_patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/pagamento_patrimonio_repository_impl.dart';
import 'package:syshouse/app/domain/entities/pagamento_patrimonio.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockPagamentoPatrimonioApi extends Mock
    implements PagamentoPatrimonioApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockPagamentoPatrimonioApi mockPagamentoPatrimonioApi;
  PagamentoPatrimonioRepositoryImpl pagamentopatrimonioRepositoryImpl;
  PagamentoPatrimonioModel pagamentopatrimonioModel;
  PagamentoPatrimonio pagamentopatrimonio;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockPagamentoPatrimonioApi = MockPagamentoPatrimonioApi();

    pagamentopatrimonioModel = PagamentoPatrimonioModel(
      id: "",
    );

    pagamentopatrimonio = pagamentopatrimonioModel;

    pagamentopatrimonioRepositoryImpl = PagamentoPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      pagamentopatrimonioApi: mockPagamentoPatrimonioApi,
    );
  });

  void mockPagamentoPatrimonioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockPagamentoPatrimonioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockPagamentoPatrimonioApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockPagamentoPatrimonioApi.find(any))
            .thenAnswer((_) async => pagamentopatrimonioModel);
        var result = await pagamentopatrimonioRepositoryImpl
            .findPagamentoPatrimonio(param);
        expect(
            result.fold((l) => l, (r) => r), isA<PagamentoPatrimonioModel>());
      });

      test('throws serverFailure', () async {
        when(mockPagamentoPatrimonioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentopatrimonioRepositoryImpl
            .findPagamentoPatrimonio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockPagamentoPatrimonioApi.list())
            .thenAnswer((_) async => [pagamentopatrimonioModel]);

        var result =
            await pagamentopatrimonioRepositoryImpl.listPagamentoPatrimonio();

        expect(result.fold((l) => l, (r) => r),
            isA<List<PagamentoPatrimonioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockPagamentoPatrimonioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await pagamentopatrimonioRepositoryImpl.listPagamentoPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockPagamentoPatrimonioApi.listPage(page, size))
            .thenAnswer((_) async => [pagamentopatrimonioModel]);

        var result = await pagamentopatrimonioRepositoryImpl
            .listPagePagamentoPatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r),
            isA<List<PagamentoPatrimonioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockPagamentoPatrimonioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentopatrimonioRepositoryImpl
            .listPagePagamentoPatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockPagamentoPatrimonioApi.delete(param))
            .thenAnswer((_) async => pagamentopatrimonioModel);

        await pagamentopatrimonioRepositoryImpl
            .deletePagamentoPatrimonio(param);

        verify(pagamentopatrimonioRepositoryImpl.pagamentopatrimonioApi
                .delete(param))
            .called(1);
      });

      test('throws serverFailure', () async {
        when(mockPagamentoPatrimonioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentopatrimonioRepositoryImpl
            .deletePagamentoPatrimonio(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockPagamentoPatrimonioApi.save(any))
            .thenAnswer((_) async => pagamentopatrimonioModel);

        var result = await pagamentopatrimonioRepositoryImpl
            .savePagamentoPatrimonio(pagamentopatrimonio);

        expect(result.fold((l) => l, (r) => r), pagamentopatrimonioModel);
      });

      test('throws serverFailure', () async {
        when(mockPagamentoPatrimonioApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentopatrimonioRepositoryImpl
            .savePagamentoPatrimonio(pagamentopatrimonio);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockPagamentoPatrimonioApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockPagamentoPatrimonioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentopatrimonioRepositoryImpl
            .findPagamentoPatrimonio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockPagamentoPatrimonioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await pagamentopatrimonioRepositoryImpl.listPagamentoPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockPagamentoPatrimonioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentopatrimonioRepositoryImpl
            .listPagePagamentoPatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockPagamentoPatrimonioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentopatrimonioRepositoryImpl
            .deletePagamentoPatrimonio(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockPagamentoPatrimonioApi.save(pagamentopatrimonio))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentopatrimonioRepositoryImpl
            .savePagamentoPatrimonio(PagamentoPatrimonio());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
