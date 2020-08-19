import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/pagamento_api.dart';
import 'package:syshouse/app/data/models/pagamento_model.dart';
import 'package:syshouse/app/data/repositories/pagamento_repository_impl.dart';
import 'package:syshouse/app/domain/entities/pagamento.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockPagamentoApi extends Mock implements PagamentoApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockPagamentoApi mockPagamentoApi;
  PagamentoRepositoryImpl pagamentoRepositoryImpl;
  PagamentoModel pagamentoModel;
  Pagamento pagamento;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockPagamentoApi = MockPagamentoApi();

    pagamentoModel = PagamentoModel(
      id: "",
    );

    pagamento = pagamentoModel;

    pagamentoRepositoryImpl = PagamentoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      pagamentoApi: mockPagamentoApi,
    );
  });

  void mockPagamentoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockPagamentoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockPagamentoApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockPagamentoApi.find(any))
            .thenAnswer((_) async => pagamentoModel);
        var result = await pagamentoRepositoryImpl.findPagamento(param);
        expect(result.fold((l) => l, (r) => r), isA<PagamentoModel>());
      });

      test('throws serverFailure', () async {
        when(mockPagamentoApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentoRepositoryImpl.findPagamento(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockPagamentoApi.list()).thenAnswer((_) async => [pagamentoModel]);

        var result = await pagamentoRepositoryImpl.listPagamento();

        expect(result.fold((l) => l, (r) => r), isA<List<PagamentoModel>>());
      });

      test('throws serverFailure', () async {
        when(mockPagamentoApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentoRepositoryImpl.listPagamento();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockPagamentoApi.listPage(page, size))
            .thenAnswer((_) async => [pagamentoModel]);

        var result =
            await pagamentoRepositoryImpl.listPagePagamento(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<PagamentoModel>>());
      });

      test('throws serverFailure', () async {
        when(mockPagamentoApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await pagamentoRepositoryImpl.listPagePagamento(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockPagamentoApi.delete(param))
            .thenAnswer((_) async => pagamentoModel);

        await pagamentoRepositoryImpl.deletePagamento(param);

        verify(pagamentoRepositoryImpl.pagamentoApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockPagamentoApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentoRepositoryImpl.deletePagamento(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockPagamentoApi.save(any))
            .thenAnswer((_) async => pagamentoModel);

        var result = await pagamentoRepositoryImpl.savePagamento(pagamento);

        expect(result.fold((l) => l, (r) => r), pagamentoModel);
      });

      test('throws serverFailure', () async {
        when(mockPagamentoApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentoRepositoryImpl.savePagamento(pagamento);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockPagamentoApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockPagamentoApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentoRepositoryImpl.findPagamento(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockPagamentoApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentoRepositoryImpl.listPagamento();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockPagamentoApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await pagamentoRepositoryImpl.listPagePagamento(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockPagamentoApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentoRepositoryImpl.deletePagamento(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockPagamentoApi.save(pagamento))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await pagamentoRepositoryImpl.savePagamento(Pagamento());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
