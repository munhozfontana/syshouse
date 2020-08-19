import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/socio_api.dart';
import 'package:syshouse/app/data/models/socio_model.dart';
import 'package:syshouse/app/data/repositories/socio_repository_impl.dart';
import 'package:syshouse/app/domain/entities/socio.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockSocioApi extends Mock implements SocioApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockSocioApi mockSocioApi;
  SocioRepositoryImpl socioRepositoryImpl;
  SocioModel socioModel;
  Socio socio;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockSocioApi = MockSocioApi();

    socioModel = SocioModel(
      id: "",
    );

    socio = socioModel;

    socioRepositoryImpl = SocioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      socioApi: mockSocioApi,
    );
  });

  void mockSocioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockSocioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockSocioApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockSocioApi.find(any)).thenAnswer((_) async => socioModel);
        var result = await socioRepositoryImpl.findSocio(param);
        expect(result.fold((l) => l, (r) => r), isA<SocioModel>());
      });

      test('throws serverFailure', () async {
        when(mockSocioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await socioRepositoryImpl.findSocio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockSocioApi.list()).thenAnswer((_) async => [socioModel]);

        var result = await socioRepositoryImpl.listSocio();

        expect(result.fold((l) => l, (r) => r), isA<List<SocioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockSocioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await socioRepositoryImpl.listSocio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockSocioApi.listPage(page, size))
            .thenAnswer((_) async => [socioModel]);

        var result = await socioRepositoryImpl.listPageSocio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<SocioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockSocioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await socioRepositoryImpl.listPageSocio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockSocioApi.delete(param)).thenAnswer((_) async => socioModel);

        await socioRepositoryImpl.deleteSocio(param);

        verify(socioRepositoryImpl.socioApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockSocioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await socioRepositoryImpl.deleteSocio(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockSocioApi.save(any)).thenAnswer((_) async => socioModel);

        var result = await socioRepositoryImpl.saveSocio(socio);

        expect(result.fold((l) => l, (r) => r), socioModel);
      });

      test('throws serverFailure', () async {
        when(mockSocioApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await socioRepositoryImpl.saveSocio(socio);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockSocioApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockSocioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await socioRepositoryImpl.findSocio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockSocioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await socioRepositoryImpl.listSocio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockSocioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await socioRepositoryImpl.listPageSocio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockSocioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await socioRepositoryImpl.deleteSocio(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockSocioApi.save(socio))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await socioRepositoryImpl.saveSocio(Socio());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
