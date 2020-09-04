import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/socio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/repositories/socio_repository_impl.dart';
import 'package:syshouse/app/domain/entities/socio.dart';
import 'package:syshouse/app/domain/usecases/socio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/socio_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreSocio storeSocio;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  Socio socioParam;

  var header = {
    'connection': 'keep-alive',
    'content-length': '629',
    'content-type': 'application/json',
    'date': 'Sat, 18 Jul 2020 14:57:29 GMT',
    'server': 'Cowboy',
    'via': '1.1 vegur',
  };

  var socioJson = fixture("socio.json");

  setUp(() {
    socioParam = Socio(
      id: "1",
      cpf: "1",
      estadoCivil: "1",
      nacionalidade: "1",
      nome: "1",
      profissao: "1",
      rg: "1",
    );

    pagination = Pagination(page: 1, size: 5);
    mockHttpAdapter = MockHttpAdapter();
    mockConnectivityAdapter = MockConnectivityAdapter();

    var socioRepository = SocioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      socioApi: SocioApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeSocio = StoreSocio(
      saveSocio: SaveSocio(
        socioRepository: socioRepository,
      ),
      findSocio: FindSocio(
        socioRepository: socioRepository,
      ),
      listSocio: ListSocio(
        socioRepository: socioRepository,
      ),
      listPageSocio: ListPageSocio(
        socioRepository: socioRepository,
      ),
      deleteSocio: DeleteSocio(
        socioRepository: socioRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: socioJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async =>
        ResponseAdapter(body: "[$socioJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(body: "[$socioJson]", statusCode: 200, header: header));
  }

  void mockSave(Object body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Object body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "$socioJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

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
    test('Find complete flow', () async {
      await storeSocio.changeSocio(socioParam);

      await mockfindById();

      await storeSocio.find(storeSocio.param);

      var result = await storeSocio.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeSocio.list();

      var result = await storeSocio.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeSocio.changePagination(newPagination: pagination);

      await storeSocio.listPage();

      var result = await storeSocio.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storeSocio.changeSocio(socioParam);

      await mockSave(storeSocio.param);

      await storeSocio.save(storeSocio.param);

      var result = storeSocio.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storeSocio.changeSocio(socioParam);

      await mockUpdate(storeSocio.param);

      await storeSocio.save(storeSocio.param);

      var result = storeSocio.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storeSocio.changeSocio(socioParam);

      await mockDelete(storeSocio.param);

      await storeSocio.delete(storeSocio.param);

      var result = storeSocio.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockSocioApiDisconnected(() {
    test('Find complete flow', () async {
      await storeSocio.changeSocio(socioParam);

      await mockfindById();

      await storeSocio.find(storeSocio.param);

      var result = await storeSocio.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeSocio.list();

      var result = await storeSocio.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeSocio.changePagination(newPagination: pagination);

      await storeSocio.listPage();

      var result = await storeSocio.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storeSocio.changeSocio(socioParam);

      await mockSave(storeSocio.param);

      await storeSocio.save(storeSocio.param);

      var result = storeSocio.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storeSocio.changeSocio(socioParam);

      await mockUpdate(storeSocio.param);

      await storeSocio.save(storeSocio.param);

      var result = storeSocio.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storeSocio.changeSocio(socioParam);

      await mockDelete(storeSocio.param);

      await storeSocio.delete(storeSocio.param);

      var result = storeSocio.resDelete;

      expect(result, isA<Left>());
    });
  });
}
