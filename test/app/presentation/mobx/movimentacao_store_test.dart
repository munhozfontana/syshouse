import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/movimentacao_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/movimentacao_model.dart';
import 'package:syshouse/app/data/repositories/movimentacao_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/movimentacao_usecases.dart';
import 'package:syshouse/app/presentation/mobx/movimentacao_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreMovimentacao storeMovimentacao;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;

  var movimentacaoJson = fixture("movimentacao.json");
  var movimentacaoModel =
      MovimentacaoModel.fromJson(json.decode(movimentacaoJson));

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

    var movimentacaoRepository = MovimentacaoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      movimentacaoApi: MovimentacaoApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeMovimentacao = StoreMovimentacao(
      saveMovimentacao: SaveMovimentacao(
        movimentacaoRepository: movimentacaoRepository,
      ),
      findMovimentacao: FindMovimentacao(
        movimentacaoRepository: movimentacaoRepository,
      ),
      listMovimentacao: ListMovimentacao(
        movimentacaoRepository: movimentacaoRepository,
      ),
      listPageMovimentacao: ListPageMovimentacao(
        movimentacaoRepository: movimentacaoRepository,
      ),
      deleteMovimentacao: DeleteMovimentacao(
        movimentacaoRepository: movimentacaoRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: movimentacaoJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$movimentacaoJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$movimentacaoJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$movimentacaoJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockMovimentacaoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockMovimentacaoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockMovimentacaoApiConnected(() {
    test('Find complete flow', () async {
      await storeMovimentacao.changeMovimentacao(movimentacaoModel);

      await mockfindById();

      await storeMovimentacao.find(storeMovimentacao.param);

      var result = await storeMovimentacao.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeMovimentacao.list();

      var result = await storeMovimentacao.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeMovimentacao.changePagination(newPagination: pagination);

      await storeMovimentacao.listPage(pagination);

      var result = await storeMovimentacao.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storeMovimentacao.changeMovimentacao(movimentacaoModel);

      await mockSave(storeMovimentacao.param.toJson());

      await storeMovimentacao.save(storeMovimentacao.param);

      var result = storeMovimentacao.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storeMovimentacao.changeMovimentacao(movimentacaoModel);

      await mockUpdate(storeMovimentacao.param.toJson());

      await storeMovimentacao.save(storeMovimentacao.param);

      var result = storeMovimentacao.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storeMovimentacao.changeMovimentacao(movimentacaoModel);

      await mockDelete(storeMovimentacao.param);

      await storeMovimentacao.delete(storeMovimentacao.param);

      var result = storeMovimentacao.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockMovimentacaoApiDisconnected(() {
    test('Find complete flow', () async {
      await storeMovimentacao.changeMovimentacao(movimentacaoModel);

      await mockfindById();

      await storeMovimentacao.find(storeMovimentacao.param);

      var result = await storeMovimentacao.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeMovimentacao.list();

      var result = await storeMovimentacao.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeMovimentacao.changePagination(newPagination: pagination);

      await storeMovimentacao.listPage(pagination);

      var result = await storeMovimentacao.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storeMovimentacao.changeMovimentacao(movimentacaoModel);

      await mockSave(storeMovimentacao.param.toJson());

      await storeMovimentacao.save(storeMovimentacao.param);

      var result = storeMovimentacao.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storeMovimentacao.changeMovimentacao(movimentacaoModel);

      await mockUpdate(storeMovimentacao.param.toJson());

      await storeMovimentacao.save(storeMovimentacao.param);

      var result = storeMovimentacao.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storeMovimentacao.changeMovimentacao(movimentacaoModel);

      await mockDelete(storeMovimentacao.param);

      await storeMovimentacao.delete(storeMovimentacao.param);

      var result = storeMovimentacao.resDelete;

      expect(result, isA<Left>());
    });
  });
}
