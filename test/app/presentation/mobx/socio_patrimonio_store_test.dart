import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/socio_patrimonio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/socio_patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/socio_patrimonio_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/socio_patrimonio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/socio_patrimonio_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreSocioPatrimonio storeSocioPatrimonio;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var sociopatrimonioJson = fixture("socio_patrimonio.json");
  var socioPatrimonioModel =
      SocioPatrimonioModel.fromJson(json.decode(sociopatrimonioJson));

  var header = {
    'connection': 'keep-alive',
    'content-length': '629',
    'content-type': 'application/json',
    'date': 'Sat, 18 Jul 2020 14:57:29 GMT',
    'server': 'Cowboy',
    'via': '1.1 vegur',
  };

  setUp(() {
    pagination = Pagination(page: 1, size: 5);
    mockHttpAdapter = MockHttpAdapter();
    mockConnectivityAdapter = MockConnectivityAdapter();

    var sociopatrimonioRepository = SocioPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      sociopatrimonioApi: SocioPatrimonioApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeSocioPatrimonio = StoreSocioPatrimonio(
      saveSocioPatrimonio: SaveSocioPatrimonio(
        sociopatrimonioRepository: sociopatrimonioRepository,
      ),
      findSocioPatrimonio: FindSocioPatrimonio(
        sociopatrimonioRepository: sociopatrimonioRepository,
      ),
      listSocioPatrimonio: ListSocioPatrimonio(
        sociopatrimonioRepository: sociopatrimonioRepository,
      ),
      listPageSocioPatrimonio: ListPageSocioPatrimonio(
        sociopatrimonioRepository: sociopatrimonioRepository,
      ),
      deleteSocioPatrimonio: DeleteSocioPatrimonio(
        sociopatrimonioRepository: sociopatrimonioRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: sociopatrimonioJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$sociopatrimonioJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$sociopatrimonioJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$sociopatrimonioJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

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
    test('Find complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(socioPatrimonioModel);

      await mockfindById();

      await storeSocioPatrimonio.find(storeSocioPatrimonio.param);

      var result = await storeSocioPatrimonio.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeSocioPatrimonio.list();

      var result = await storeSocioPatrimonio.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeSocioPatrimonio.changePagination(newPagination: pagination);

      await storeSocioPatrimonio.listPage(pagination);

      var result = await storeSocioPatrimonio.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(socioPatrimonioModel);

      await mockSave(storeSocioPatrimonio.param.toJson());

      await storeSocioPatrimonio.save(storeSocioPatrimonio.param);

      var result = storeSocioPatrimonio.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(socioPatrimonioModel);

      await mockUpdate(storeSocioPatrimonio.param.toJson());

      await storeSocioPatrimonio.save(storeSocioPatrimonio.param);

      var result = storeSocioPatrimonio.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(socioPatrimonioModel);

      await mockDelete(storeSocioPatrimonio.param);

      await storeSocioPatrimonio.delete(storeSocioPatrimonio.param);

      var result = storeSocioPatrimonio.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockSocioPatrimonioApiDisconnected(() {
    test('Find complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(socioPatrimonioModel);

      await mockfindById();

      await storeSocioPatrimonio.find(storeSocioPatrimonio.param);

      var result = await storeSocioPatrimonio.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeSocioPatrimonio.list();

      var result = await storeSocioPatrimonio.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeSocioPatrimonio.changePagination(newPagination: pagination);

      await storeSocioPatrimonio.listPage(pagination);

      var result = await storeSocioPatrimonio.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(socioPatrimonioModel);

      await mockSave(storeSocioPatrimonio.param.toJson());

      await storeSocioPatrimonio.save(storeSocioPatrimonio.param);

      var result = storeSocioPatrimonio.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(socioPatrimonioModel);

      await mockUpdate(storeSocioPatrimonio.param.toJson());

      await storeSocioPatrimonio.save(storeSocioPatrimonio.param);

      var result = storeSocioPatrimonio.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(socioPatrimonioModel);

      await mockDelete(storeSocioPatrimonio.param);

      await storeSocioPatrimonio.delete(storeSocioPatrimonio.param);

      var result = storeSocioPatrimonio.resDelete;

      expect(result, isA<Left>());
    });
  });
}
