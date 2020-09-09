import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/recebimento_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/recebimento_model.dart';
import 'package:syshouse/app/data/repositories/recebimento_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/recebimento_usecases.dart';
import 'package:syshouse/app/presentation/mobx/recebimento_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreRecebimento storeRecebimento;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var recebimentoJson = fixture("recebimento.json");
  var patrimonioModel = RecebimentoModel.fromJson(json.decode(recebimentoJson));

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

    var recebimentoRepository = RecebimentoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      recebimentoApi: RecebimentoApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeRecebimento = StoreRecebimento(
      saveRecebimento: SaveRecebimento(
        recebimentoRepository: recebimentoRepository,
      ),
      findRecebimento: FindRecebimento(
        recebimentoRepository: recebimentoRepository,
      ),
      listRecebimento: ListRecebimento(
        recebimentoRepository: recebimentoRepository,
      ),
      listPageRecebimento: ListPageRecebimento(
        recebimentoRepository: recebimentoRepository,
      ),
      deleteRecebimento: DeleteRecebimento(
        recebimentoRepository: recebimentoRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: recebimentoJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$recebimentoJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$recebimentoJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$recebimentoJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockRecebimentoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockRecebimentoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockRecebimentoApiConnected(() {
    test('Find complete flow', () async {
      await storeRecebimento.changeRecebimento(patrimonioModel);

      await mockfindById();

      await storeRecebimento.find(storeRecebimento.param);

      var result = await storeRecebimento.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeRecebimento.list();

      var result = await storeRecebimento.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeRecebimento.changePagination(newPagination: pagination);

      await storeRecebimento.listPage(pagination);

      var result = await storeRecebimento.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storeRecebimento.changeRecebimento(patrimonioModel);

      await mockSave(storeRecebimento.param.toJson());

      await storeRecebimento.save(storeRecebimento.param);

      var result = storeRecebimento.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storeRecebimento.changeRecebimento(patrimonioModel);

      await mockUpdate(storeRecebimento.param.toJson());

      await storeRecebimento.save(storeRecebimento.param);

      var result = storeRecebimento.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storeRecebimento.changeRecebimento(patrimonioModel);

      await mockDelete(storeRecebimento.param);

      await storeRecebimento.delete(storeRecebimento.param);

      var result = storeRecebimento.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockRecebimentoApiDisconnected(() {
    test('Find complete flow', () async {
      await storeRecebimento.changeRecebimento(patrimonioModel);

      await mockfindById();

      await storeRecebimento.find(storeRecebimento.param);

      var result = await storeRecebimento.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeRecebimento.list();

      var result = await storeRecebimento.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeRecebimento.changePagination(newPagination: pagination);

      await storeRecebimento.listPage(pagination);

      var result = await storeRecebimento.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storeRecebimento.changeRecebimento(patrimonioModel);

      await mockSave(storeRecebimento.param.toJson());

      await storeRecebimento.save(storeRecebimento.param);

      var result = storeRecebimento.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storeRecebimento.changeRecebimento(patrimonioModel);

      await mockUpdate(storeRecebimento.param.toJson());

      await storeRecebimento.save(storeRecebimento.param);

      var result = storeRecebimento.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storeRecebimento.changeRecebimento(patrimonioModel);

      await mockDelete(storeRecebimento.param);

      await storeRecebimento.delete(storeRecebimento.param);

      var result = storeRecebimento.resDelete;

      expect(result, isA<Left>());
    });
  });
}
