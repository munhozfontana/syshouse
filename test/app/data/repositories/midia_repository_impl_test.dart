import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/midia_api.dart';
import 'package:syshouse/app/data/models/midia_model.dart';
import 'package:syshouse/app/data/repositories/midia_repository_impl.dart';
import 'package:syshouse/app/domain/entities/midia.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockMidiaApi extends Mock implements MidiaApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockMidiaApi mockMidiaApi;
  MidiaRepositoryImpl midiaRepositoryImpl;
  MidiaModel midiaModel;
  Midia midia;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockMidiaApi = MockMidiaApi();

    midiaModel = MidiaModel(
      id: "",
    );

    midia = midiaModel;

    midiaRepositoryImpl = MidiaRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      midiaApi: mockMidiaApi,
    );
  });

  void mockMidiaApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockMidiaApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockMidiaApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockMidiaApi.find(any)).thenAnswer((_) async => midiaModel);
        var result = await midiaRepositoryImpl.findMidia(param);
        expect(result.fold((l) => l, (r) => r), isA<MidiaModel>());
      });

      test('throws serverFailure', () async {
        when(mockMidiaApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await midiaRepositoryImpl.findMidia(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockMidiaApi.list()).thenAnswer((_) async => [midiaModel]);

        var result = await midiaRepositoryImpl.listMidia();

        expect(result.fold((l) => l, (r) => r), isA<List<MidiaModel>>());
      });

      test('throws serverFailure', () async {
        when(mockMidiaApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await midiaRepositoryImpl.listMidia();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockMidiaApi.listPage(page, size))
            .thenAnswer((_) async => [midiaModel]);

        var result = await midiaRepositoryImpl.listPageMidia(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<MidiaModel>>());
      });

      test('throws serverFailure', () async {
        when(mockMidiaApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await midiaRepositoryImpl.listPageMidia(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockMidiaApi.delete(param)).thenAnswer((_) async => midiaModel);

        await midiaRepositoryImpl.deleteMidia(param);

        verify(midiaRepositoryImpl.midiaApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockMidiaApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await midiaRepositoryImpl.deleteMidia(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockMidiaApi.save(any)).thenAnswer((_) async => midiaModel);

        var result = await midiaRepositoryImpl.saveMidia(midia);

        expect(result.fold((l) => l, (r) => r), midiaModel);
      });

      test('throws serverFailure', () async {
        when(mockMidiaApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await midiaRepositoryImpl.saveMidia(midia);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockMidiaApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockMidiaApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await midiaRepositoryImpl.findMidia(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockMidiaApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await midiaRepositoryImpl.listMidia();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockMidiaApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await midiaRepositoryImpl.listPageMidia(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockMidiaApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await midiaRepositoryImpl.deleteMidia(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockMidiaApi.save(midia))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await midiaRepositoryImpl.saveMidia(Midia());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
