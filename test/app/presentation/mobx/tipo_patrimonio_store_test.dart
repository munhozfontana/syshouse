import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/tipo_patrimonio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/repositories/tipo_patrimonio_repository_impl.dart';
import 'package:syshouse/app/domain/entities/tipo_patrimonio.dart';
import 'package:syshouse/app/domain/usecases/tipo_patrimonio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/tipo_patrimonio_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreTipoPatrimonio storeTipoPatrimonio;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  TipoPatrimonio tipopatrimonioParam;

  var header = {
    'connection': 'keep-alive',
    'content-length': '629',
    'content-type': 'application/json',
    'date': 'Sat, 18 Jul 2020 14:57:29 GMT',
    'server': 'Cowboy',
    'via': '1.1 vegur',
  };

  var tipopatrimonioJson = fixture("tipo_patrimonio.json");

  setUp(() {
    tipopatrimonioParam = TipoPatrimonio(
      id: "1",
      descricao: "1",
    );

    pagination = Pagination(page: 1, size: 5);
    mockHttpAdapter = MockHttpAdapter();
    mockConnectivityAdapter = MockConnectivityAdapter();

    var tipoPatrimonioRepository = TipoPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      tipopatrimonioApi: TipoPatrimonioApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeTipoPatrimonio = StoreTipoPatrimonio(
      saveTipoPatrimonio: SaveTipoPatrimonio(
        tipoPatrimonioRepository: tipoPatrimonioRepository,
      ),
      findTipoPatrimonio: FindTipoPatrimonio(
        tipoPatrimonioRepository: tipoPatrimonioRepository,
      ),
      listTipoPatrimonio: ListTipoPatrimonio(
        tipoPatrimonioRepository: tipoPatrimonioRepository,
      ),
      listPageTipoPatrimonio: ListPageTipoPatrimonio(
        tipoPatrimonioRepository: tipoPatrimonioRepository,
      ),
      deleteTipoPatrimonio: DeleteTipoPatrimonio(
        tipoPatrimonioRepository: tipoPatrimonioRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: tipopatrimonioJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$tipopatrimonioJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$tipopatrimonioJson]", statusCode: 200, header: header));
  }

  void mockSave(Object body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Object body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$tipopatrimonioJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockTipoPatrimonioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockTipoPatrimonioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockTipoPatrimonioApiConnected(() {
    test('Find complete flow', () async {
      await storeTipoPatrimonio.changeTipoPatrimonio(tipopatrimonioParam);

      await mockfindById();

      await storeTipoPatrimonio.find(storeTipoPatrimonio.param);

      var result = await storeTipoPatrimonio.resFind;

      expect(result, isA<Right>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeTipoPatrimonio.list();

      var result = await storeTipoPatrimonio.reslist;

      expect(result, isA<Right>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeTipoPatrimonio.changePagination(newPagination: pagination);

      await storeTipoPatrimonio.listPage(pagination);

      var result = await storeTipoPatrimonio.reslistPage;

      expect(result, isA<Right>());
    });
    test('Save complete flow', () async {
      await storeTipoPatrimonio.changeTipoPatrimonio(tipopatrimonioParam);

      await mockSave(storeTipoPatrimonio.param);

      await storeTipoPatrimonio.save(storeTipoPatrimonio.param);

      var result = storeTipoPatrimonio.resSave;

      expect(result, isA<Right>());
    });

    test('Update complete flow', () async {
      await storeTipoPatrimonio.changeTipoPatrimonio(tipopatrimonioParam);

      await mockUpdate(storeTipoPatrimonio.param);

      await storeTipoPatrimonio.save(storeTipoPatrimonio.param);

      var result = storeTipoPatrimonio.resSave;

      expect(result, isA<Right>());
    });

    test('Delete complete flow', () async {
      await storeTipoPatrimonio.changeTipoPatrimonio(tipopatrimonioParam);

      await mockDelete(storeTipoPatrimonio.param);

      await storeTipoPatrimonio.delete(storeTipoPatrimonio.param);

      var result = storeTipoPatrimonio.resDelete;

      expect(result, isA<Right>());
    });
  });
  mockTipoPatrimonioApiDisconnected(() {
    test('Find complete flow', () async {
      await storeTipoPatrimonio.changeTipoPatrimonio(tipopatrimonioParam);

      await mockfindById();

      await storeTipoPatrimonio.find(storeTipoPatrimonio.param);

      var result = await storeTipoPatrimonio.resFind;

      expect(result, isA<Left>());
    });

    test('List complete flow', () async {
      await mocklist();

      await storeTipoPatrimonio.list();

      var result = await storeTipoPatrimonio.reslist;

      expect(result, isA<Left>());
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeTipoPatrimonio.changePagination(newPagination: pagination);

      await storeTipoPatrimonio.listPage(pagination);

      var result = await storeTipoPatrimonio.reslistPage;

      expect(result, isA<Left>());
    });
    test('Save complete flow', () async {
      await storeTipoPatrimonio.changeTipoPatrimonio(tipopatrimonioParam);

      await mockSave(storeTipoPatrimonio.param);

      await storeTipoPatrimonio.save(storeTipoPatrimonio.param);

      var result = storeTipoPatrimonio.resSave;

      expect(result, isA<Left>());
    });

    test('Update complete flow', () async {
      await storeTipoPatrimonio.changeTipoPatrimonio(tipopatrimonioParam);

      await mockUpdate(storeTipoPatrimonio.param);

      await storeTipoPatrimonio.save(storeTipoPatrimonio.param);

      var result = storeTipoPatrimonio.resSave;

      expect(result, isA<Left>());
    });

    test('Delete complete flow', () async {
      await storeTipoPatrimonio.changeTipoPatrimonio(tipopatrimonioParam);

      await mockDelete(storeTipoPatrimonio.param);

      await storeTipoPatrimonio.delete(storeTipoPatrimonio.param);

      var result = storeTipoPatrimonio.resDelete;

      expect(result, isA<Left>());
    });
  });
}
