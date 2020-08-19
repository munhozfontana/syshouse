import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/tipo_despesa_api.dart';
import 'package:syshouse/app/data/models/tipo_despesa_model.dart';
import 'package:syshouse/app/data/repositories/tipo_despesa_repository_impl.dart';
import 'package:syshouse/app/domain/entities/tipo_despesa.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockTipoDespesaApi extends Mock implements TipoDespesaApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockTipoDespesaApi mockTipoDespesaApi;
  TipoDespesaRepositoryImpl tipodespesaRepositoryImpl;
  TipoDespesaModel tipodespesaModel;
  TipoDespesa tipodespesa;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockTipoDespesaApi = MockTipoDespesaApi();

    tipodespesaModel = TipoDespesaModel(
      id: "",
    );

    tipodespesa = tipodespesaModel;

    tipodespesaRepositoryImpl = TipoDespesaRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      tipodespesaApi: mockTipoDespesaApi,
    );
  });

  void mockTipoDespesaApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockTipoDespesaApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockTipoDespesaApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockTipoDespesaApi.find(any))
            .thenAnswer((_) async => tipodespesaModel);
        var result = await tipodespesaRepositoryImpl.findTipoDespesa(param);
        expect(result.fold((l) => l, (r) => r), isA<TipoDespesaModel>());
      });

      test('throws serverFailure', () async {
        when(mockTipoDespesaApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipodespesaRepositoryImpl.findTipoDespesa(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockTipoDespesaApi.list())
            .thenAnswer((_) async => [tipodespesaModel]);

        var result = await tipodespesaRepositoryImpl.listTipoDespesa();

        expect(result.fold((l) => l, (r) => r), isA<List<TipoDespesaModel>>());
      });

      test('throws serverFailure', () async {
        when(mockTipoDespesaApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipodespesaRepositoryImpl.listTipoDespesa();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockTipoDespesaApi.listPage(page, size))
            .thenAnswer((_) async => [tipodespesaModel]);

        var result =
            await tipodespesaRepositoryImpl.listPageTipoDespesa(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<TipoDespesaModel>>());
      });

      test('throws serverFailure', () async {
        when(mockTipoDespesaApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await tipodespesaRepositoryImpl.listPageTipoDespesa(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockTipoDespesaApi.delete(param))
            .thenAnswer((_) async => tipodespesaModel);

        await tipodespesaRepositoryImpl.deleteTipoDespesa(param);

        verify(tipodespesaRepositoryImpl.tipodespesaApi.delete(param))
            .called(1);
      });

      test('throws serverFailure', () async {
        when(mockTipoDespesaApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipodespesaRepositoryImpl.deleteTipoDespesa(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockTipoDespesaApi.save(any))
            .thenAnswer((_) async => tipodespesaModel);

        var result =
            await tipodespesaRepositoryImpl.saveTipoDespesa(tipodespesa);

        expect(result.fold((l) => l, (r) => r), tipodespesaModel);
      });

      test('throws serverFailure', () async {
        when(mockTipoDespesaApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await tipodespesaRepositoryImpl.saveTipoDespesa(tipodespesa);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockTipoDespesaApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockTipoDespesaApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipodespesaRepositoryImpl.findTipoDespesa(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockTipoDespesaApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipodespesaRepositoryImpl.listTipoDespesa();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockTipoDespesaApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await tipodespesaRepositoryImpl.listPageTipoDespesa(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockTipoDespesaApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await tipodespesaRepositoryImpl.deleteTipoDespesa(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockTipoDespesaApi.save(tipodespesa))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await tipodespesaRepositoryImpl.saveTipoDespesa(TipoDespesa());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
