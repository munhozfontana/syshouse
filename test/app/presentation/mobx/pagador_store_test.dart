import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/pagador_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/pagador_model.dart';
import 'package:syshouse/app/data/repositories/pagador_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/pagador_usecases.dart';
import 'package:syshouse/app/presentation/mobx/pagador_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StorePagador storePagador;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;

  var pagadorJson = fixture("pagador.json");
  var pagadorModel = PagadorModel.fromJson(json.decode(pagadorJson));

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

    var pagadorRepository = PagadorRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      pagadorApi: PagadorApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storePagador = StorePagador(
      savePagador: SavePagador(
        pagadorRepository: pagadorRepository,
      ),
      findPagador: FindPagador(
        pagadorRepository: pagadorRepository,
      ),
      listPagador: ListPagador(
        pagadorRepository: pagadorRepository,
      ),
      listPagePagador: ListPagePagador(
        pagadorRepository: pagadorRepository,
      ),
      deletePagador: DeletePagador(
        pagadorRepository: pagadorRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: pagadorJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$pagadorJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$pagadorJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "$pagadorJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockPagadorApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockPagadorApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockPagadorApiConnected(() {
    test('Find complete flow', () async {
      await storePagador.changePagador(pagadorModel);

      await mockfindById();

      await storePagador.find(storePagador.param);

      var result = await storePagador.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storePagador.list();

      var result = await storePagador.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storePagador.changePagination(newPagination: pagination);

      await storePagador.listPage(pagination);

      var result = await storePagador.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storePagador.changePagador(pagadorModel);

      await mockSave(storePagador.param.toJson());

      await storePagador.save(storePagador.param);

      var result = storePagador.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storePagador.changePagador(pagadorModel);

      await mockUpdate(storePagador.param.toJson());

      await storePagador.save(storePagador.param);

      var result = storePagador.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storePagador.changePagador(pagadorModel);

      await mockDelete(storePagador.param);

      await storePagador.delete(storePagador.param);

      var result = storePagador.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockPagadorApiDisconnected(() {
    test('Find complete flow', () async {
      await storePagador.changePagador(pagadorModel);

      await mockfindById();

      await storePagador.find(storePagador.param);

      var result = await storePagador.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storePagador.list();

      var result = await storePagador.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storePagador.changePagination(newPagination: pagination);

      await storePagador.listPage(pagination);

      var result = await storePagador.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storePagador.changePagador(pagadorModel);

      await mockSave(storePagador.param.toJson());

      await storePagador.save(storePagador.param);

      var result = storePagador.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storePagador.changePagador(pagadorModel);

      await mockUpdate(storePagador.param.toJson());

      await storePagador.save(storePagador.param);

      var result = storePagador.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storePagador.changePagador(pagadorModel);

      await mockDelete(storePagador.param);

      await storePagador.delete(storePagador.param);

      var result = storePagador.resDelete;

      expect(result, isA<Left>());
    });
  });
}
