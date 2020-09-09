import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/localizacao_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/data/repositories/localizacao_repository_impl.dart';
import 'package:syshouse/app/domain/usecases/localizacao_usecases.dart';
import 'package:syshouse/app/presentation/mobx/localizacao_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreLocalizacao storeLocalizacao;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;

  var localizacaoJson = fixture("localizacao.json");
  var localizacaoModel =
      LocalizacaoModel.fromJson(json.decode(localizacaoJson));

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

    var localizacaoRepository = LocalizacaoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      localizacaoApi: LocalizacaoApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeLocalizacao = StoreLocalizacao(
      saveLocalizacao: SaveLocalizacao(
        localizacaoRepository: localizacaoRepository,
      ),
      findLocalizacao: FindLocalizacao(
        localizacaoRepository: localizacaoRepository,
      ),
      listLocalizacao: ListLocalizacao(
        localizacaoRepository: localizacaoRepository,
      ),
      listPageLocalizacao: ListPageLocalizacao(
        localizacaoRepository: localizacaoRepository,
      ),
      deleteLocalizacao: DeleteLocalizacao(
        localizacaoRepository: localizacaoRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: localizacaoJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$localizacaoJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$localizacaoJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$localizacaoJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockLocalizacaoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockLocalizacaoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockLocalizacaoApiConnected(() {
    test('Find complete flow', () async {
      await storeLocalizacao.changeLocalizacao(localizacaoModel);

      await mockfindById();

      await storeLocalizacao.find(storeLocalizacao.param);

      var result = await storeLocalizacao.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeLocalizacao.list();

      var result = await storeLocalizacao.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeLocalizacao.changePagination(newPagination: pagination);

      await storeLocalizacao.listPage(pagination);

      var result = await storeLocalizacao.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storeLocalizacao.changeLocalizacao(localizacaoModel);

      await mockSave(storeLocalizacao.param.toJson());

      await storeLocalizacao.save(storeLocalizacao.param);

      var result = storeLocalizacao.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storeLocalizacao.changeLocalizacao(localizacaoModel);

      await mockUpdate(storeLocalizacao.param.toJson());

      await storeLocalizacao.save(storeLocalizacao.param);

      var result = storeLocalizacao.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storeLocalizacao.changeLocalizacao(localizacaoModel);

      await mockDelete(storeLocalizacao.param);

      await storeLocalizacao.delete(storeLocalizacao.param);

      var result = storeLocalizacao.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockLocalizacaoApiDisconnected(() {
    test('Find complete flow', () async {
      await storeLocalizacao.changeLocalizacao(localizacaoModel);

      await mockfindById();

      await storeLocalizacao.find(storeLocalizacao.param);

      var result = await storeLocalizacao.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeLocalizacao.list();

      var result = await storeLocalizacao.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeLocalizacao.changePagination(newPagination: pagination);

      await storeLocalizacao.listPage(pagination);

      var result = await storeLocalizacao.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storeLocalizacao.changeLocalizacao(localizacaoModel);

      await mockSave(storeLocalizacao.param.toJson());

      await storeLocalizacao.save(storeLocalizacao.param);

      var result = storeLocalizacao.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storeLocalizacao.changeLocalizacao(localizacaoModel);

      await mockUpdate(storeLocalizacao.param.toJson());

      await storeLocalizacao.save(storeLocalizacao.param);

      var result = storeLocalizacao.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storeLocalizacao.changeLocalizacao(localizacaoModel);

      await mockDelete(storeLocalizacao.param);

      await storeLocalizacao.delete(storeLocalizacao.param);

      var result = storeLocalizacao.resDelete;

      expect(result, isA<Left>());
    });
  });
}
