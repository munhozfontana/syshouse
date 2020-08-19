import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/patrimonio_api.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/patrimonio_repository_impl.dart';
import 'package:syshouse/app/domain/entities/patrimonio.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockPatrimonioApi extends Mock implements PatrimonioApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockPatrimonioApi mockPatrimonioApi;
  PatrimonioRepositoryImpl patrimonioRepositoryImpl;
  PatrimonioModel patrimonioModel;
  Patrimonio patrimonio;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockPatrimonioApi = MockPatrimonioApi();

    patrimonioModel = PatrimonioModel(
      id: "",
    );

    patrimonio = patrimonioModel;

    patrimonioRepositoryImpl = PatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      patrimonioApi: mockPatrimonioApi,
    );
  });

  void mockPatrimonioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockPatrimonioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockPatrimonioApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockPatrimonioApi.find(any))
            .thenAnswer((_) async => patrimonioModel);
        var result = await patrimonioRepositoryImpl.findPatrimonio(param);
        expect(result.fold((l) => l, (r) => r), isA<PatrimonioModel>());
      });

      test('throws serverFailure', () async {
        when(mockPatrimonioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await patrimonioRepositoryImpl.findPatrimonio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockPatrimonioApi.list())
            .thenAnswer((_) async => [patrimonioModel]);

        var result = await patrimonioRepositoryImpl.listPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<List<PatrimonioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockPatrimonioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await patrimonioRepositoryImpl.listPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockPatrimonioApi.listPage(page, size))
            .thenAnswer((_) async => [patrimonioModel]);

        var result =
            await patrimonioRepositoryImpl.listPagePatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<PatrimonioModel>>());
      });

      test('throws serverFailure', () async {
        when(mockPatrimonioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await patrimonioRepositoryImpl.listPagePatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockPatrimonioApi.delete(param))
            .thenAnswer((_) async => patrimonioModel);

        await patrimonioRepositoryImpl.deletePatrimonio(param);

        verify(patrimonioRepositoryImpl.patrimonioApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockPatrimonioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await patrimonioRepositoryImpl.deletePatrimonio(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockPatrimonioApi.save(any))
            .thenAnswer((_) async => patrimonioModel);

        var result = await patrimonioRepositoryImpl.savePatrimonio(patrimonio);

        expect(result.fold((l) => l, (r) => r), patrimonioModel);
      });

      test('throws serverFailure', () async {
        when(mockPatrimonioApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await patrimonioRepositoryImpl.savePatrimonio(patrimonio);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockPatrimonioApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockPatrimonioApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await patrimonioRepositoryImpl.findPatrimonio(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockPatrimonioApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await patrimonioRepositoryImpl.listPatrimonio();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockPatrimonioApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await patrimonioRepositoryImpl.listPagePatrimonio(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockPatrimonioApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await patrimonioRepositoryImpl.deletePatrimonio(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockPatrimonioApi.save(patrimonio))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await patrimonioRepositoryImpl.savePatrimonio(Patrimonio());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
