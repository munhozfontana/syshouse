import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/recebimento_patrimonio_api.dart';
import 'package:syshouse/app/data/models/recebimento_patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/recebimento_patrimonio_repository_impl.dart';
import 'package:syshouse/app/domain/entities/recebimento_patrimonio.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockRecebimentoPatrimonioApi extends Mock
    implements RecebimentoPatrimonioApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockRecebimentoPatrimonioApi mockRecebimentoPatrimonioApi;
  RecebimentoPatrimonioRepositoryImpl recebimentopatrimonioRepositoryImpl;
  RecebimentoPatrimonioModel recebimentopatrimonioModel;
  RecebimentoPatrimonio recebimentopatrimonio;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockRecebimentoPatrimonioApi = MockRecebimentoPatrimonioApi();

    recebimentopatrimonioModel = RecebimentoPatrimonioModel(
      id: "",
    );

    recebimentopatrimonio = recebimentopatrimonioModel;

    recebimentopatrimonioRepositoryImpl = RecebimentoPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      recebimentopatrimonioApi: mockRecebimentoPatrimonioApi,
    );
  });

  void mockRecebimentoPatrimonioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockRecebimentoPatrimonioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockRecebimentoPatrimonioApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockRecebimentoPatrimonioApi.find(any))
            .thenAnswer((_) async => recebimentopatrimonioModel);
        var result = await recebimentopatrimonioRepositoryImpl
            .findRecebimentoPatrimonio(param);
        expect(
            result.fold((l) => l, (r) => r), isA<RecebimentoPatrimonioModel>());
      });

      test('throws serverFailure', () async {
        when(mockRecebimentoPatrimonioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentopatrimonioRepositoryImpl
            .findRecebimentoPatrimonio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockRecebimentoPatrimonioApi.list())
            .thenAnswer((_) async => [recebimentopatrimonioModel]);

        var result = await recebimentopatrimonioRepositoryImpl
            .listRecebimentoPatrimonio();

        expect(result.fold((l) => l, (r) => r),
            isA<List<RecebimentoPatrimonioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockRecebimentoPatrimonioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentopatrimonioRepositoryImpl
            .listRecebimentoPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockRecebimentoPatrimonioApi.listPage(page, size))
            .thenAnswer((_) async => [recebimentopatrimonioModel]);

        var result = await recebimentopatrimonioRepositoryImpl
            .listPageRecebimentoPatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r),
            isA<List<RecebimentoPatrimonioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockRecebimentoPatrimonioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentopatrimonioRepositoryImpl
            .listPageRecebimentoPatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockRecebimentoPatrimonioApi.delete(param))
            .thenAnswer((_) async => recebimentopatrimonioModel);

        await recebimentopatrimonioRepositoryImpl
            .deleteRecebimentoPatrimonio(param);

        verify(recebimentopatrimonioRepositoryImpl.recebimentopatrimonioApi
                .delete(param))
            .called(1);
      });

      test('throws serverFailure', () async {
        when(mockRecebimentoPatrimonioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentopatrimonioRepositoryImpl
            .deleteRecebimentoPatrimonio(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockRecebimentoPatrimonioApi.save(any))
            .thenAnswer((_) async => recebimentopatrimonioModel);

        var result = await recebimentopatrimonioRepositoryImpl
            .saveRecebimentoPatrimonio(recebimentopatrimonio);

        expect(result.fold((l) => l, (r) => r), recebimentopatrimonioModel);
      });

      test('throws serverFailure', () async {
        when(mockRecebimentoPatrimonioApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentopatrimonioRepositoryImpl
            .saveRecebimentoPatrimonio(recebimentopatrimonio);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockRecebimentoPatrimonioApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockRecebimentoPatrimonioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentopatrimonioRepositoryImpl
            .findRecebimentoPatrimonio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockRecebimentoPatrimonioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentopatrimonioRepositoryImpl
            .listRecebimentoPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockRecebimentoPatrimonioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentopatrimonioRepositoryImpl
            .listPageRecebimentoPatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockRecebimentoPatrimonioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentopatrimonioRepositoryImpl
            .deleteRecebimentoPatrimonio(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockRecebimentoPatrimonioApi.save(recebimentopatrimonio))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await recebimentopatrimonioRepositoryImpl
            .saveRecebimentoPatrimonio(RecebimentoPatrimonio());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
