import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/contato_api.dart';
import 'package:syshouse/app/data/models/contato_model.dart';
import 'package:syshouse/app/data/repositories/contato_repository_impl.dart';
import 'package:syshouse/app/domain/entities/contato.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/error/failure.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';

class MockContatoApi extends Mock implements ContatoApi {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  MockConnectivityAdapter mockConnectivityAdapter;
  MockContatoApi mockContatoApi;
  ContatoRepositoryImpl contatoRepositoryImpl;
  ContatoModel contatoModel;
  Contato contato;

  var param = "1";
  var page = 1;
  var size = 1;

  setUp(() {
    mockConnectivityAdapter = MockConnectivityAdapter();
    mockContatoApi = MockContatoApi();

    contatoModel = ContatoModel(
      email: "",
      fone: "",
      id: "",
      pagadorId: "",
      socioId: "",
      whatsapp: true,
    );

    contato = contatoModel;

    contatoRepositoryImpl = ContatoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      contatoApi: mockContatoApi,
    );
  });

  void mockContatoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockContatoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockContatoApiConnected(() {
    group('Find', () {
      test('no failures', () async {
        when(mockContatoApi.find(any)).thenAnswer((_) async => contatoModel);
        var result = await contatoRepositoryImpl.findContato(param);
        expect(result.fold((l) => l, (r) => r), isA<ContatoModel>());
      });

      test('throws serverFailure', () async {
        when(mockContatoApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await contatoRepositoryImpl.findContato(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('list', () {
      test('no failures', () async {
        when(mockContatoApi.list()).thenAnswer((_) async => [contatoModel]);

        var result = await contatoRepositoryImpl.listContato();

        expect(result.fold((l) => l, (r) => r), isA<List<ContatoModel>>());
      });

      test('throws serverFailure', () async {
        when(mockContatoApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await contatoRepositoryImpl.listContato();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('listPage', () {
      test('no failures', () async {
        when(mockContatoApi.listPage(page, size))
            .thenAnswer((_) async => [contatoModel]);

        var result = await contatoRepositoryImpl.listPageContato(page, size);

        expect(result.fold((l) => l, (r) => r), isA<List<ContatoModel>>());
      });

      test('throws serverFailure', () async {
        when(mockContatoApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await contatoRepositoryImpl.listPageContato(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('no failures', () async {
        when(mockContatoApi.delete(param))
            .thenAnswer((_) async => contatoModel);

        await contatoRepositoryImpl.deleteContato(param);

        verify(contatoRepositoryImpl.contatoApi.delete(param)).called(1);
      });

      test('throws serverFailure', () async {
        when(mockContatoApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await contatoRepositoryImpl.deleteContato(param);

        expect(result, isA<Either<Failure, void>>());
      });
    });
    group('save', () {
      test('no failures', () async {
        when(mockContatoApi.save(any)).thenAnswer((_) async => contatoModel);

        var result = await contatoRepositoryImpl.saveContato(contato);

        expect(result.fold((l) => l, (r) => r), contatoModel);
      });

      test('throws serverFailure', () async {
        when(mockContatoApi.save(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await contatoRepositoryImpl.saveContato(contato);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });

  mockContatoApiDisconnected(() {
    group('Find', () {
      test('throws serverFailure', () async {
        when(mockContatoApi.find(any))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await contatoRepositoryImpl.findContato(param);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('list', () {
      test('throws serverFailure', () async {
        when(mockContatoApi.list())
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await contatoRepositoryImpl.listContato();

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
    group('listPage', () {
      test('throws serverFailure', () async {
        when(mockContatoApi.listPage(page, size))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await contatoRepositoryImpl.listPageContato(page, size);

        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });

    group('delete', () {
      test('throws serverFailure', () async {
        when(mockContatoApi.delete(param))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await contatoRepositoryImpl.deleteContato(param);
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
      });
    });
    group('save', () {
      test('throws serverFailure', () async {
        when(mockContatoApi.save(contato))
            .thenThrow(ServerApiException(error: 'AnyError'));

        var result = await contatoRepositoryImpl.saveContato(Contato());
        expect(result.fold((l) => l, (r) => r), isA<ServerFailure>());
      });
    });
  });
}
