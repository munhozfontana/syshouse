import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/movimentacao_api.dart';
import 'package:syshouse/app/data/models/movimentacao_model.dart';
import 'package:syshouse/app/data/repositories/movimentacao_repository_impl.dart';
import 'package:syshouse/app/domain/entities/movimentacao.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockMovimentacaoApi extends Mock implements MovimentacaoApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockMovimentacaoApi mockMovimentacaoApi;
  MovimentacaoRepositoryImpl movimentacaoRepositoryImpl;
  MovimentacaoModel movimentacaoModel;
  Movimentacao movimentacao;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockMovimentacaoApi = MockMovimentacaoApi();

    movimentacaoModel = MovimentacaoModel(
      id: "",
    );

    movimentacao = movimentacaoModel;

    movimentacaoRepositoryImpl = MovimentacaoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      movimentacaoApi: mockMovimentacaoApi,
    );
  });

  void mockMovimentacaoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockMovimentacaoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockMovimentacaoApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockMovimentacaoApi.find(any))
            .thenAnswer((_) async => movimentacaoModel);
        var result = await movimentacaoRepositoryImpl.findMovimentacao(param);
        expect(result.fold((l) => l, (r) => r), isA<MovimentacaoModel>());
      });

      test('throws serverFailure', () async {
        when(mockMovimentacaoApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await movimentacaoRepositoryImpl.findMovimentacao(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockMovimentacaoApi.list())
            .thenAnswer((_) async => [movimentacaoModel]);

        var result = await movimentacaoRepositoryImpl.listMovimentacao();

        expect(result.fold((l) => l, (r) => r), isA<List<MovimentacaoModel>>());
      });

      test('throws serverFailure', () async {
        when(mockMovimentacaoApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await movimentacaoRepositoryImpl.listMovimentacao();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockMovimentacaoApi.listPage(page, size))
            .thenAnswer((_) async => [movimentacaoModel]);

        var result =
            await movimentacaoRepositoryImpl.listPageMovimentacao(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<MovimentacaoModel>>());
      });

      test('throws serverFailure', () async {
        when(mockMovimentacaoApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await movimentacaoRepositoryImpl.listPageMovimentacao(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockMovimentacaoApi.delete(param))
            .thenAnswer((_) async => movimentacaoModel);

        await movimentacaoRepositoryImpl.deleteMovimentacao(param);

        verify(movimentacaoRepositoryImpl.movimentacaoApi.delete(param))
            .called(1);
      });

      test('throws serverFailure', () async {
        when(mockMovimentacaoApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await movimentacaoRepositoryImpl.deleteMovimentacao(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockMovimentacaoApi.save(any))
            .thenAnswer((_) async => movimentacaoModel);

        var result =
            await movimentacaoRepositoryImpl.saveMovimentacao(movimentacao);

        expect(result.fold((l) => l, (r) => r), movimentacaoModel);
      });

      test('throws serverFailure', () async {
        when(mockMovimentacaoApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await movimentacaoRepositoryImpl.saveMovimentacao(movimentacao);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockMovimentacaoApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockMovimentacaoApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await movimentacaoRepositoryImpl.findMovimentacao(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockMovimentacaoApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await movimentacaoRepositoryImpl.listMovimentacao();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockMovimentacaoApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await movimentacaoRepositoryImpl.listPageMovimentacao(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockMovimentacaoApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await movimentacaoRepositoryImpl.deleteMovimentacao(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockMovimentacaoApi.save(movimentacao))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await movimentacaoRepositoryImpl.saveMovimentacao(Movimentacao());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
