import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/tipo_renda_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/tipo_renda_model.dart';
import 'package:syshouse/app/data/repositories/tipo_renda_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/tipo_renda_usecases.dart';
import 'package:syshouse/app/presentation/mobx/shared/enuns/enum_load_state.dart';
import 'package:syshouse/app/presentation/mobx/shared/loading_store.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';
import 'package:syshouse/app/presentation/mobx/tipo_renda_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreTipoRenda storeTipoRenda;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var tiporendaJson = fixture("tipo_renda.json");
  var tiporendaModel = TipoRendaModel.fromJson(json.decode(tiporendaJson));

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

    var tipoRendaRepository = TipoRendaRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      tiporendaApi: TipoRendaApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeTipoRenda = StoreTipoRenda(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      saveTipoRenda: SaveTipoRenda(
        tipoRendaRepository: tipoRendaRepository,
      ),
      findTipoRenda: FindTipoRenda(
        tipoRendaRepository: tipoRendaRepository,
      ),
      listTipoRenda: ListTipoRenda(
        tipoRendaRepository: tipoRendaRepository,
      ),
      listPageTipoRenda: ListPageTipoRenda(
        tipoRendaRepository: tipoRendaRepository,
      ),
      deleteTipoRenda: DeleteTipoRenda(
        tipoRendaRepository: tipoRendaRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: tiporendaJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$tiporendaJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$tiporendaJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: tiporendaJson, statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$tiporendaJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockTipoRendaApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockTipoRendaApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockTipoRendaApiConnected(() {
    test('Find complete flow', () async {
      await storeTipoRenda.changeTipoRenda(tiporendaModel);

      await mockfindById();

      await storeTipoRenda.find(storeTipoRenda.param);

      var result = await storeTipoRenda.resFind;

      expect(result, tiporendaModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storeTipoRenda.list();

      var result = await storeTipoRenda.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeTipoRenda.changePagination(newPagination: pagination);

      await storeTipoRenda.listPage();

      var result = await storeTipoRenda.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storeTipoRenda.changeTipoRenda(tiporendaModel);

      await mockSave(storeTipoRenda.param.toJson());

      await storeTipoRenda.save(storeTipoRenda.param);

      var result = storeTipoRenda.resSave;

      expect(result, tiporendaModel);
    });

    test('Update complete flow', () async {
      await storeTipoRenda.changeTipoRenda(tiporendaModel);

      await mockUpdate(storeTipoRenda.param.toJson());

      await storeTipoRenda.save(storeTipoRenda.param);

      var result = storeTipoRenda.resSave;

      expect(result, tiporendaModel);
    });

    test('Delete complete flow', () async {
      await storeTipoRenda.changeTipoRenda(tiporendaModel);

      await mockDelete(storeTipoRenda.param);

      await storeTipoRenda.delete(storeTipoRenda.param);

      expect(storeTipoRenda.loadingStore.loadState, EnumLoadState.loaded);
    });
  });
  mockTipoRendaApiDisconnected(() {
    test('Find complete flow', () async {
      await storeTipoRenda.changeTipoRenda(tiporendaModel);

      await mockfindById();

      await storeTipoRenda.find(storeTipoRenda.param);

      expect(
        storeTipoRenda.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storeTipoRenda.list();

      expect(
        storeTipoRenda.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeTipoRenda.changePagination(newPagination: pagination);

      await storeTipoRenda.listPage();

      expect(
        storeTipoRenda.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storeTipoRenda.changeTipoRenda(tiporendaModel);

      await mockSave(storeTipoRenda.param.toJson());

      await storeTipoRenda.save(storeTipoRenda.param);

      expect(
        storeTipoRenda.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storeTipoRenda.changeTipoRenda(tiporendaModel);

      await mockUpdate(storeTipoRenda.param.toJson());

      await storeTipoRenda.save(storeTipoRenda.param);

      expect(
        storeTipoRenda.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storeTipoRenda.changeTipoRenda(tiporendaModel);

      await mockDelete(storeTipoRenda.param);

      await storeTipoRenda.delete(storeTipoRenda.param);

      expect(
        storeTipoRenda.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
