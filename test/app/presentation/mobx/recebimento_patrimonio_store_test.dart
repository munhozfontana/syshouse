import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/recebimento_patrimonio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/recebimento_patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/recebimento_patrimonio_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/recebimento_patrimonio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/recebimento_patrimonio_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreRecebimentoPatrimonio storeRecebimentoPatrimonio;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;

  var header = {
    'connection': 'keep-alive',
    'content-length': '629',
    'content-type': 'application/json',
    'date': 'Sat, 18 Jul 2020 14:57:29 GMT',
    'server': 'Cowboy',
    'via': '1.1 vegur',
  };

  var recebimentopatrimonioJson = fixture("recebimento_patrimonio.json");
  var recebimentoPatrimonioModel = RecebimentoPatrimonioModel.fromJson(
      json.decode(recebimentopatrimonioJson));

  setUp(() {
    pagination = Pagination(page: 1, size: 5);
    mockHttpAdapter = MockHttpAdapter();
    mockConnectivityAdapter = MockConnectivityAdapter();

    var recebimentopatrimonioRepository = RecebimentoPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      recebimentopatrimonioApi: RecebimentoPatrimonioApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeRecebimentoPatrimonio = StoreRecebimentoPatrimonio(
      saveRecebimentoPatrimonio: SaveRecebimentoPatrimonio(
        recebimentopatrimonioRepository: recebimentopatrimonioRepository,
      ),
      findRecebimentoPatrimonio: FindRecebimentoPatrimonio(
        recebimentopatrimonioRepository: recebimentopatrimonioRepository,
      ),
      listRecebimentoPatrimonio: ListRecebimentoPatrimonio(
        recebimentopatrimonioRepository: recebimentopatrimonioRepository,
      ),
      listPageRecebimentoPatrimonio: ListPageRecebimentoPatrimonio(
        recebimentopatrimonioRepository: recebimentopatrimonioRepository,
      ),
      deleteRecebimentoPatrimonio: DeleteRecebimentoPatrimonio(
        recebimentopatrimonioRepository: recebimentopatrimonioRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: recebimentopatrimonioJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$recebimentopatrimonioJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$recebimentopatrimonioJson]",
            statusCode: 200,
            header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$recebimentopatrimonioJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockRecebimentoPatrimonioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockRecebimentoPatrimonioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockRecebimentoPatrimonioApiConnected(() {
    test('Find complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentoPatrimonioModel);

      await mockfindById();

      await storeRecebimentoPatrimonio.find(storeRecebimentoPatrimonio.param);

      var result = await storeRecebimentoPatrimonio.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeRecebimentoPatrimonio.list();

      var result = await storeRecebimentoPatrimonio.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeRecebimentoPatrimonio.changePagination(
          newPagination: pagination);

      await storeRecebimentoPatrimonio.listPage(pagination);

      var result = await storeRecebimentoPatrimonio.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentoPatrimonioModel);

      await mockSave(storeRecebimentoPatrimonio.param.toJson());

      await storeRecebimentoPatrimonio.save(storeRecebimentoPatrimonio.param);

      var result = storeRecebimentoPatrimonio.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentoPatrimonioModel);

      await mockUpdate(storeRecebimentoPatrimonio.param.toJson());

      await storeRecebimentoPatrimonio.save(storeRecebimentoPatrimonio.param);

      var result = storeRecebimentoPatrimonio.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentoPatrimonioModel);

      await mockDelete(storeRecebimentoPatrimonio.param);

      await storeRecebimentoPatrimonio.delete(storeRecebimentoPatrimonio.param);

      var result = storeRecebimentoPatrimonio.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockRecebimentoPatrimonioApiDisconnected(() {
    test('Find complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentoPatrimonioModel);

      await mockfindById();

      await storeRecebimentoPatrimonio.find(storeRecebimentoPatrimonio.param);

      var result = await storeRecebimentoPatrimonio.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeRecebimentoPatrimonio.list();

      var result = await storeRecebimentoPatrimonio.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeRecebimentoPatrimonio.changePagination(
          newPagination: pagination);

      await storeRecebimentoPatrimonio.listPage(pagination);

      var result = await storeRecebimentoPatrimonio.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentoPatrimonioModel);

      await mockSave(storeRecebimentoPatrimonio.param.toJson());

      await storeRecebimentoPatrimonio.save(storeRecebimentoPatrimonio.param);

      var result = storeRecebimentoPatrimonio.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentoPatrimonioModel);

      await mockUpdate(storeRecebimentoPatrimonio.param.toJson());

      await storeRecebimentoPatrimonio.save(storeRecebimentoPatrimonio.param);

      var result = storeRecebimentoPatrimonio.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentoPatrimonioModel);

      await mockDelete(storeRecebimentoPatrimonio.param);

      await storeRecebimentoPatrimonio.delete(storeRecebimentoPatrimonio.param);

      var result = storeRecebimentoPatrimonio.resDelete;

      expect(result, isA<Left>());
    });
  });
}
