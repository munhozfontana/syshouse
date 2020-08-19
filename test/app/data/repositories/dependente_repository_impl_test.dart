import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/dependente_api.dart';
import 'package:syshouse/app/data/models/dependente_model.dart';
import 'package:syshouse/app/data/repositories/dependente_repository_impl.dart';
import 'package:syshouse/app/domain/entities/dependente.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockDependenteApi extends Mock implements DependenteApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockDependenteApi mockDependenteApi;
  DependenteRepositoryImpl dependenteRepositoryImpl;
  DependenteModel dependenteModel;
  Dependente dependente;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockDependenteApi = MockDependenteApi();

    dependenteModel = DependenteModel(
      id: "",
      pagadorId: "",
    );

    dependente = dependenteModel;

    dependenteRepositoryImpl = DependenteRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      dependenteApi: mockDependenteApi,
    );
  });

  void mockDependenteApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockDependenteApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockDependenteApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockDependenteApi.find(any))
            .thenAnswer((_) async => dependenteModel);
        var result = await dependenteRepositoryImpl.findDependente(param);
        expect(result.fold((l) => l, (r) => r), isA<DependenteModel>());
      });

      test('throws serverFailure', () async {
        when(mockDependenteApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await dependenteRepositoryImpl.findDependente(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockDependenteApi.list())
            .thenAnswer((_) async => [dependenteModel]);

        var result = await dependenteRepositoryImpl.listDependente();

        expect(result.fold((l) => l, (r) => r), isA<List<DependenteModel>>());
      });

      test('throws serverFailure', () async {
        when(mockDependenteApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await dependenteRepositoryImpl.listDependente();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockDependenteApi.listPage(page, size))
            .thenAnswer((_) async => [dependenteModel]);

        var result =
            await dependenteRepositoryImpl.listPageDependente(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<DependenteModel>>());
      });

      test('throws serverFailure', () async {
        when(mockDependenteApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await dependenteRepositoryImpl.listPageDependente(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockDependenteApi.delete(param))
            .thenAnswer((_) async => dependenteModel);

        await dependenteRepositoryImpl.deleteDependente(param);

        verify(dependenteRepositoryImpl.dependenteApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockDependenteApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await dependenteRepositoryImpl.deleteDependente(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockDependenteApi.save(any))
            .thenAnswer((_) async => dependenteModel);

        var result = await dependenteRepositoryImpl.saveDependente(dependente);

        expect(result.fold((l) => l, (r) => r), dependenteModel);
      });

      test('throws serverFailure', () async {
        when(mockDependenteApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await dependenteRepositoryImpl.saveDependente(dependente);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockDependenteApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockDependenteApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await dependenteRepositoryImpl.findDependente(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockDependenteApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await dependenteRepositoryImpl.listDependente();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockDependenteApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await dependenteRepositoryImpl.listPageDependente(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockDependenteApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await dependenteRepositoryImpl.deleteDependente(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockDependenteApi.save(dependente))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result =
            await dependenteRepositoryImpl.saveDependente(Dependente());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
