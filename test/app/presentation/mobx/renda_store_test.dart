import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/renda_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/renda_model.dart';
import 'package:syshouse/app/data/repositories/renda_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/renda_usecases.dart';
import 'package:syshouse/app/presentation/mobx/renda_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreRenda storeRenda;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var rendaJson = fixture("renda.json");
  var rendaModel = RendaModel.fromJson(json.decode(rendaJson));

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

    var rendaRepository = RendaRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      rendaApi: RendaApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeRenda = StoreRenda(
      saveRenda: SaveRenda(
        rendaRepository: rendaRepository,
      ),
      findRenda: FindRenda(
        rendaRepository: rendaRepository,
      ),
      listRenda: ListRenda(
        rendaRepository: rendaRepository,
      ),
      listPageRenda: ListPageRenda(
        rendaRepository: rendaRepository,
      ),
      deleteRenda: DeleteRenda(
        rendaRepository: rendaRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: rendaJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async =>
        ResponseAdapter(body: "[$rendaJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(body: "[$rendaJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "$rendaJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockRendaApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockRendaApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockRendaApiConnected(() {
    test('Find complete flow', () async {
      await storeRenda.changeRenda(rendaModel);

      await mockfindById();

      await storeRenda.find(storeRenda.param);

      var result = await storeRenda.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeRenda.list();

      var result = await storeRenda.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeRenda.changePagination(newPagination: pagination);

      await storeRenda.listPage(pagination);

      var result = await storeRenda.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storeRenda.changeRenda(rendaModel);

      await mockSave(storeRenda.param.toJson());

      await storeRenda.save(storeRenda.param);

      var result = storeRenda.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storeRenda.changeRenda(rendaModel);

      await mockUpdate(storeRenda.param.toJson());

      await storeRenda.save(storeRenda.param);

      var result = storeRenda.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storeRenda.changeRenda(rendaModel);

      await mockDelete(storeRenda.param);

      await storeRenda.delete(storeRenda.param);

      var result = storeRenda.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockRendaApiDisconnected(() {
    test('Find complete flow', () async {
      await storeRenda.changeRenda(rendaModel);

      await mockfindById();

      await storeRenda.find(storeRenda.param);

      var result = await storeRenda.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeRenda.list();

      var result = await storeRenda.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeRenda.changePagination(newPagination: pagination);

      await storeRenda.listPage(pagination);

      var result = await storeRenda.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storeRenda.changeRenda(rendaModel);

      await mockSave(storeRenda.param.toJson());

      await storeRenda.save(storeRenda.param);

      var result = storeRenda.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storeRenda.changeRenda(rendaModel);

      await mockUpdate(storeRenda.param.toJson());

      await storeRenda.save(storeRenda.param);

      var result = storeRenda.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storeRenda.changeRenda(rendaModel);

      await mockDelete(storeRenda.param);

      await storeRenda.delete(storeRenda.param);

      var result = storeRenda.resDelete;

      expect(result, isA<Left>());
    });
  });
}
