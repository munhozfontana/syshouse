import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/pagamento_patrimonio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/pagamento_patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/pagamento_patrimonio_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/pagamento_patrimonio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/pagamento_patrimonio_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StorePagamentoPatrimonio storePagamentoPatrimonio;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;

  var pagamentopatrimonioJson = fixture("pagamento_patrimonio.json");
  var pagamentoPatrimonioModel =
      PagamentoPatrimonioModel.fromJson(json.decode(pagamentopatrimonioJson));

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

    var pagamentopatrimonioRepository = PagamentoPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      pagamentopatrimonioApi: PagamentoPatrimonioApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storePagamentoPatrimonio = StorePagamentoPatrimonio(
      savePagamentoPatrimonio: SavePagamentoPatrimonio(
        pagamentopatrimonioRepository: pagamentopatrimonioRepository,
      ),
      findPagamentoPatrimonio: FindPagamentoPatrimonio(
        pagamentopatrimonioRepository: pagamentopatrimonioRepository,
      ),
      listPagamentoPatrimonio: ListPagamentoPatrimonio(
        pagamentopatrimonioRepository: pagamentopatrimonioRepository,
      ),
      listPagePagamentoPatrimonio: ListPagePagamentoPatrimonio(
        pagamentopatrimonioRepository: pagamentopatrimonioRepository,
      ),
      deletePagamentoPatrimonio: DeletePagamentoPatrimonio(
        pagamentopatrimonioRepository: pagamentopatrimonioRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: pagamentopatrimonioJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$pagamentopatrimonioJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$pagamentopatrimonioJson]",
            statusCode: 200,
            header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$pagamentopatrimonioJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockPagamentoPatrimonioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockPagamentoPatrimonioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockPagamentoPatrimonioApiConnected(() {
    test('Find complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentoPatrimonioModel);

      await mockfindById();

      await storePagamentoPatrimonio.find(storePagamentoPatrimonio.param);

      var result = await storePagamentoPatrimonio.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storePagamentoPatrimonio.list();

      var result = await storePagamentoPatrimonio.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storePagamentoPatrimonio.changePagination(
          newPagination: pagination);

      await storePagamentoPatrimonio.listPage(pagination);

      var result = await storePagamentoPatrimonio.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentoPatrimonioModel);

      await mockSave(storePagamentoPatrimonio.param.toJson());

      await storePagamentoPatrimonio.save(storePagamentoPatrimonio.param);

      var result = storePagamentoPatrimonio.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentoPatrimonioModel);

      await mockUpdate(storePagamentoPatrimonio.param.toJson());

      await storePagamentoPatrimonio.save(storePagamentoPatrimonio.param);

      var result = storePagamentoPatrimonio.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentoPatrimonioModel);

      await mockDelete(storePagamentoPatrimonio.param);

      await storePagamentoPatrimonio.delete(storePagamentoPatrimonio.param);

      var result = storePagamentoPatrimonio.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockPagamentoPatrimonioApiDisconnected(() {
    test('Find complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentoPatrimonioModel);

      await mockfindById();

      await storePagamentoPatrimonio.find(storePagamentoPatrimonio.param);

      var result = await storePagamentoPatrimonio.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storePagamentoPatrimonio.list();

      var result = await storePagamentoPatrimonio.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storePagamentoPatrimonio.changePagination(
          newPagination: pagination);

      await storePagamentoPatrimonio.listPage(pagination);

      var result = await storePagamentoPatrimonio.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentoPatrimonioModel);

      await mockSave(storePagamentoPatrimonio.param.toJson());

      await storePagamentoPatrimonio.save(storePagamentoPatrimonio.param);

      var result = storePagamentoPatrimonio.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentoPatrimonioModel);

      await mockUpdate(storePagamentoPatrimonio.param.toJson());

      await storePagamentoPatrimonio.save(storePagamentoPatrimonio.param);

      var result = storePagamentoPatrimonio.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentoPatrimonioModel);

      await mockDelete(storePagamentoPatrimonio.param);

      await storePagamentoPatrimonio.delete(storePagamentoPatrimonio.param);

      var result = storePagamentoPatrimonio.resDelete;

      expect(result, isA<Left>());
    });
  });
}
