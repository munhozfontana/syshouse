import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/despesa_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/despesa_model.dart';
import 'package:syshouse/app/data/repositories/despesa_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/despesa_usecases.dart';
import 'package:syshouse/app/presentation/mobx/despesa_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreDespesa storeDespesa;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;

  var despesaJson = fixture("despesa.json");
  var despesaModel = DespesaModel.fromJson(json.decode(despesaJson));

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

    var despesaRepository = DespesaRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      despesaApi: DespesaApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeDespesa = StoreDespesa(
      saveDespesa: SaveDespesa(
        despesaRepository: despesaRepository,
      ),
      findDespesa: FindDespesa(
        despesaRepository: despesaRepository,
      ),
      listDespesa: ListDespesa(
        despesaRepository: despesaRepository,
      ),
      listPageDespesa: ListPageDespesa(
        despesaRepository: despesaRepository,
      ),
      deleteDespesa: DeleteDespesa(
        despesaRepository: despesaRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: despesaJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$despesaJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$despesaJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "$despesaJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockDespesaApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockDespesaApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockDespesaApiConnected(() {
    test('Find complete flow', () async {
      await storeDespesa.changeDespesa(despesaModel);

      await mockfindById();

      await storeDespesa.find(storeDespesa.param);

      var result = await storeDespesa.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeDespesa.list();

      var result = await storeDespesa.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeDespesa.changePagination(newPagination: pagination);

      await storeDespesa.listPage(pagination);

      var result = await storeDespesa.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storeDespesa.changeDespesa(despesaModel);

      await mockSave(storeDespesa.param.toJson());

      await storeDespesa.save(storeDespesa.param);

      var result = storeDespesa.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storeDespesa.changeDespesa(despesaModel);

      await mockUpdate(storeDespesa.param.toJson());

      await storeDespesa.save(storeDespesa.param);

      var result = storeDespesa.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storeDespesa.changeDespesa(despesaModel);

      await mockDelete(storeDespesa.param);

      await storeDespesa.delete(storeDespesa.param);

      var result = storeDespesa.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockDespesaApiDisconnected(() {
    test('Find complete flow', () async {
      await storeDespesa.changeDespesa(despesaModel);

      await mockfindById();

      await storeDespesa.find(storeDespesa.param);

      var result = await storeDespesa.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeDespesa.list();

      var result = await storeDespesa.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeDespesa.changePagination(newPagination: pagination);

      await storeDespesa.listPage(pagination);

      var result = await storeDespesa.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storeDespesa.changeDespesa(despesaModel);

      await mockSave(storeDespesa.param.toJson());

      await storeDespesa.save(storeDespesa.param);

      var result = storeDespesa.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storeDespesa.changeDespesa(despesaModel);

      await mockUpdate(storeDespesa.param.toJson());

      await storeDespesa.save(storeDespesa.param);

      var result = storeDespesa.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storeDespesa.changeDespesa(despesaModel);

      await mockDelete(storeDespesa.param);

      await storeDespesa.delete(storeDespesa.param);

      var result = storeDespesa.resDelete;

      expect(result, isA<Left>());
    });
  });
}
