import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/municipio_api.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/data/repositories/municipio_repository_impl.dart';
import 'package:syshouse/app/domain/entities/municipio.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockMunicipioApi extends Mock implements MunicipioApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockMunicipioApi mockMunicipioApi;
  MunicipioRepositoryImpl municipioRepositoryImpl;
  MunicipioModel municipioModel;
  Municipio municipio;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockMunicipioApi = MockMunicipioApi();

    municipioModel = MunicipioModel(
      id: "",
    );

    municipio = municipioModel;

    municipioRepositoryImpl = MunicipioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      municipioApi: mockMunicipioApi,
    );
  });

  void mockMunicipioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockMunicipioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockMunicipioApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockMunicipioApi.find(any))
            .thenAnswer((_) async => municipioModel);
        var result = await municipioRepositoryImpl.findMunicipio(param);
        expect(result.fold((l) => l, (r) => r), isA<MunicipioModel>());
      });

      test('throws serverFailure', () async {
        when(mockMunicipioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await municipioRepositoryImpl.findMunicipio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockMunicipioApi.list()).thenAnswer((_) async => [municipioModel]);

        var result = await municipioRepositoryImpl.listMunicipio();

        expect(result.fold((l) => l, (r) => r), isA<List<MunicipioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockMunicipioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await municipioRepositoryImpl.listMunicipio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockMunicipioApi.listPage(page, size))
            .thenAnswer((_) async => [municipioModel]);

        var result =
            await municipioRepositoryImpl.listPageMunicipio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<MunicipioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockMunicipioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await municipioRepositoryImpl.listPageMunicipio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockMunicipioApi.delete(param))
            .thenAnswer((_) async => municipioModel);

        await municipioRepositoryImpl.deleteMunicipio(param);

        verify(municipioRepositoryImpl.municipioApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockMunicipioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await municipioRepositoryImpl.deleteMunicipio(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockMunicipioApi.save(any))
            .thenAnswer((_) async => municipioModel);

        var result = await municipioRepositoryImpl.saveMunicipio(municipio);

        expect(result.fold((l) => l, (r) => r), municipioModel);
      });

      test('throws serverFailure', () async {
        when(mockMunicipioApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await municipioRepositoryImpl.saveMunicipio(municipio);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockMunicipioApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockMunicipioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await municipioRepositoryImpl.findMunicipio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockMunicipioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await municipioRepositoryImpl.listMunicipio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockMunicipioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await municipioRepositoryImpl.listPageMunicipio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockMunicipioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await municipioRepositoryImpl.deleteMunicipio(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockMunicipioApi.save(municipio))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await municipioRepositoryImpl.saveMunicipio(Municipio());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
