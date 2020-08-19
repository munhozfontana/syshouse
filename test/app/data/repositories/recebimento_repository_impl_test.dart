import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/recebimento_api.dart';
import 'package:syshouse/app/data/models/recebimento_model.dart';
import 'package:syshouse/app/data/repositories/recebimento_repository_impl.dart';
import 'package:syshouse/app/domain/entities/recebimento.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockRecebimentoApi extends Mock implements RecebimentoApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockRecebimentoApi mockRecebimentoApi;
  RecebimentoRepositoryImpl recebimentoRepositoryImpl;
  RecebimentoModel recebimentoModel;
  Recebimento recebimento;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockRecebimentoApi = MockRecebimentoApi();

    recebimentoModel = RecebimentoModel(
      id: "",
    );

    recebimento = recebimentoModel;

    recebimentoRepositoryImpl = RecebimentoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      recebimentoApi: mockRecebimentoApi,
    );
  });

  void mockRecebimentoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockRecebimentoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockRecebimentoApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockRecebimentoApi.find(any))
            .thenAnswer((_) async => recebimentoModel);
        var result = await recebimentoRepositoryImpl.findRecebimento(param);
        expect(result.fold((l) => l, (r) => r), isA<RecebimentoModel>());
      });

      test('throws serverFailure', () async {
        when(mockRecebimentoApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentoRepositoryImpl.findRecebimento(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockRecebimentoApi.list())
            .thenAnswer((_) async => [recebimentoModel]);

        var result = await recebimentoRepositoryImpl.listRecebimento();

        expect(result.fold((l) => l, (r) => r), isA<List<RecebimentoModel>>());
      });

      test('throws serverFailure', () async {
        when(mockRecebimentoApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentoRepositoryImpl.listRecebimento();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockRecebimentoApi.listPage(page, size))
            .thenAnswer((_) async => [recebimentoModel]);

        var result =
            await recebimentoRepositoryImpl.listPageRecebimento(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<RecebimentoModel>>());
      });

      test('throws serverFailure', () async {
        when(mockRecebimentoApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await recebimentoRepositoryImpl.listPageRecebimento(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockRecebimentoApi.delete(param))
            .thenAnswer((_) async => recebimentoModel);

        await recebimentoRepositoryImpl.deleteRecebimento(param);

        verify(recebimentoRepositoryImpl.recebimentoApi.delete(param))
            .called(1);
      });

      test('throws serverFailure', () async {
        when(mockRecebimentoApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentoRepositoryImpl.deleteRecebimento(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockRecebimentoApi.save(any))
            .thenAnswer((_) async => recebimentoModel);

        var result =
            await recebimentoRepositoryImpl.saveRecebimento(recebimento);

        expect(result.fold((l) => l, (r) => r), recebimentoModel);
      });

      test('throws serverFailure', () async {
        when(mockRecebimentoApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await recebimentoRepositoryImpl.saveRecebimento(recebimento);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockRecebimentoApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockRecebimentoApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentoRepositoryImpl.findRecebimento(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockRecebimentoApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentoRepositoryImpl.listRecebimento();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockRecebimentoApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await recebimentoRepositoryImpl.listPageRecebimento(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockRecebimentoApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentoRepositoryImpl.deleteRecebimento(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockRecebimentoApi.save(recebimento))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await recebimentoRepositoryImpl.saveRecebimento(Recebimento());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
