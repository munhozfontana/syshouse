import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/socio_patrimonio_api.dart';
import 'package:syshouse/app/data/models/socio_patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/socio_patrimonio_repository_impl.dart';
import 'package:syshouse/app/domain/entities/socio_patrimonio.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockSocioPatrimonioApi extends Mock implements SocioPatrimonioApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockSocioPatrimonioApi mockSocioPatrimonioApi;
  SocioPatrimonioRepositoryImpl sociopatrimonioRepositoryImpl;
  SocioPatrimonioModel sociopatrimonioModel;
  SocioPatrimonio sociopatrimonio;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockSocioPatrimonioApi = MockSocioPatrimonioApi();

    sociopatrimonioModel = SocioPatrimonioModel(
      id: "",
    );

    sociopatrimonio = sociopatrimonioModel;

    sociopatrimonioRepositoryImpl = SocioPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      sociopatrimonioApi: mockSocioPatrimonioApi,
    );
  });

  void mockSocioPatrimonioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockSocioPatrimonioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockSocioPatrimonioApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockSocioPatrimonioApi.find(any))
            .thenAnswer((_) async => sociopatrimonioModel);
        var result =
            await sociopatrimonioRepositoryImpl.findSocioPatrimonio(param);
        expect(result.fold((l) => l, (r) => r), isA<SocioPatrimonioModel>());
      });

      test('throws serverFailure', () async {
        when(mockSocioPatrimonioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await sociopatrimonioRepositoryImpl.findSocioPatrimonio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockSocioPatrimonioApi.list())
            .thenAnswer((_) async => [sociopatrimonioModel]);

        var result = await sociopatrimonioRepositoryImpl.listSocioPatrimonio();

        expect(
            result.fold((l) => l, (r) => r), isA<List<SocioPatrimonioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockSocioPatrimonioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await sociopatrimonioRepositoryImpl.listSocioPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockSocioPatrimonioApi.listPage(page, size))
            .thenAnswer((_) async => [sociopatrimonioModel]);

        var result = await sociopatrimonioRepositoryImpl
            .listPageSocioPatrimonio(page, size);

        expect(
            result.fold((l) => l, (r) => r), isA<List<SocioPatrimonioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockSocioPatrimonioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await sociopatrimonioRepositoryImpl
            .listPageSocioPatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockSocioPatrimonioApi.delete(param))
            .thenAnswer((_) async => sociopatrimonioModel);

        await sociopatrimonioRepositoryImpl.deleteSocioPatrimonio(param);

        verify(sociopatrimonioRepositoryImpl.sociopatrimonioApi.delete(param))
            .called(1);
      });

      test('throws serverFailure', () async {
        when(mockSocioPatrimonioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await sociopatrimonioRepositoryImpl.deleteSocioPatrimonio(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockSocioPatrimonioApi.save(any))
            .thenAnswer((_) async => sociopatrimonioModel);

        var result = await sociopatrimonioRepositoryImpl
            .saveSocioPatrimonio(sociopatrimonio);

        expect(result.fold((l) => l, (r) => r), sociopatrimonioModel);
      });

      test('throws serverFailure', () async {
        when(mockSocioPatrimonioApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await sociopatrimonioRepositoryImpl
            .saveSocioPatrimonio(sociopatrimonio);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockSocioPatrimonioApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockSocioPatrimonioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await sociopatrimonioRepositoryImpl.findSocioPatrimonio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockSocioPatrimonioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await sociopatrimonioRepositoryImpl.listSocioPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockSocioPatrimonioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await sociopatrimonioRepositoryImpl
            .listPageSocioPatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockSocioPatrimonioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await sociopatrimonioRepositoryImpl.deleteSocioPatrimonio(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockSocioPatrimonioApi.save(sociopatrimonio))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await sociopatrimonioRepositoryImpl
            .saveSocioPatrimonio(SocioPatrimonio());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
