import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/localizacao_api.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/data/repositories/localizacao_repository_impl.dart';
import 'package:syshouse/app/domain/entities/localizacao.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockLocalizacaoApi extends Mock implements LocalizacaoApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockLocalizacaoApi mockLocalizacaoApi;
  LocalizacaoRepositoryImpl localizacaoRepositoryImpl;
  LocalizacaoModel localizacaoModel;
  Localizacao localizacao;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockLocalizacaoApi = MockLocalizacaoApi();

    localizacaoModel = LocalizacaoModel(
      id: "",
    );

    localizacao = localizacaoModel;

    localizacaoRepositoryImpl = LocalizacaoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      localizacaoApi: mockLocalizacaoApi,
    );
  });

  void mockLocalizacaoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockLocalizacaoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockLocalizacaoApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockLocalizacaoApi.find(any))
            .thenAnswer((_) async => localizacaoModel);
        var result = await localizacaoRepositoryImpl.findLocalizacao(param);
        expect(result.fold((l) => l, (r) => r), isA<LocalizacaoModel>());
      });

      test('throws serverFailure', () async {
        when(mockLocalizacaoApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await localizacaoRepositoryImpl.findLocalizacao(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockLocalizacaoApi.list())
            .thenAnswer((_) async => [localizacaoModel]);

        var result = await localizacaoRepositoryImpl.listLocalizacao();

        expect(result.fold((l) => l, (r) => r), isA<List<LocalizacaoModel>>());
      });

      test('throws serverFailure', () async {
        when(mockLocalizacaoApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await localizacaoRepositoryImpl.listLocalizacao();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockLocalizacaoApi.listPage(page, size))
            .thenAnswer((_) async => [localizacaoModel]);

        var result =
            await localizacaoRepositoryImpl.listPageLocalizacao(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<LocalizacaoModel>>());
      });

      test('throws serverFailure', () async {
        when(mockLocalizacaoApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await localizacaoRepositoryImpl.listPageLocalizacao(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockLocalizacaoApi.delete(param))
            .thenAnswer((_) async => localizacaoModel);

        await localizacaoRepositoryImpl.deleteLocalizacao(param);

        verify(localizacaoRepositoryImpl.localizacaoApi.delete(param))
            .called(1);
      });

      test('throws serverFailure', () async {
        when(mockLocalizacaoApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await localizacaoRepositoryImpl.deleteLocalizacao(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockLocalizacaoApi.save(any))
            .thenAnswer((_) async => localizacaoModel);

        var result =
            await localizacaoRepositoryImpl.saveLocalizacao(localizacao);

        expect(result.fold((l) => l, (r) => r), localizacaoModel);
      });

      test('throws serverFailure', () async {
        when(mockLocalizacaoApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await localizacaoRepositoryImpl.saveLocalizacao(localizacao);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockLocalizacaoApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockLocalizacaoApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await localizacaoRepositoryImpl.findLocalizacao(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockLocalizacaoApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await localizacaoRepositoryImpl.listLocalizacao();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockLocalizacaoApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await localizacaoRepositoryImpl.listPageLocalizacao(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockLocalizacaoApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await localizacaoRepositoryImpl.deleteLocalizacao(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockLocalizacaoApi.save(localizacao))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await localizacaoRepositoryImpl.saveLocalizacao(Localizacao());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
