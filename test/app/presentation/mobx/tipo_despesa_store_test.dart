import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/tipo_despesa_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/tipo_despesa_model.dart';
import 'package:syshouse/app/data/repositories/tipo_despesa_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/tipo_despesa_usecases.dart';
import 'package:syshouse/app/presentation/mobx/shared/enuns/enum_load_state.dart';
import 'package:syshouse/app/presentation/mobx/shared/loading_store.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';
import 'package:syshouse/app/presentation/mobx/tipo_despesa_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreTipoDespesa storeTipoDespesa;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var tipodespesaJson = fixture("tipo_despesa.json");
  var tipodespesaModel =
      TipoDespesaModel.fromJson(json.decode(tipodespesaJson));

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

    var tipoDespesaRepository = TipoDespesaRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      tipodespesaApi: TipoDespesaApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeTipoDespesa = StoreTipoDespesa(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      saveTipoDespesa: SaveTipoDespesa(
        tipoDespesaRepository: tipoDespesaRepository,
      ),
      findTipoDespesa: FindTipoDespesa(
        tipoDespesaRepository: tipoDespesaRepository,
      ),
      listTipoDespesa: ListTipoDespesa(
        tipoDespesaRepository: tipoDespesaRepository,
      ),
      listPageTipoDespesa: ListPageTipoDespesa(
        tipoDespesaRepository: tipoDespesaRepository,
      ),
      deleteTipoDespesa: DeleteTipoDespesa(
        tipoDespesaRepository: tipoDespesaRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: tipodespesaJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$tipodespesaJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$tipodespesaJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: tipodespesaJson, statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$tipodespesaJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockTipoDespesaApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockTipoDespesaApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockTipoDespesaApiConnected(() {
    test('Find complete flow', () async {
      await storeTipoDespesa.changeTipoDespesa(tipodespesaModel);

      await mockfindById();

      await storeTipoDespesa.find(storeTipoDespesa.param);

      var result = await storeTipoDespesa.resFind;

      expect(result, tipodespesaModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storeTipoDespesa.list();

      var result = await storeTipoDespesa.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeTipoDespesa.changePagination(newPagination: pagination);

      await storeTipoDespesa.listPage();

      var result = await storeTipoDespesa.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storeTipoDespesa.changeTipoDespesa(tipodespesaModel);

      await mockSave(storeTipoDespesa.param.toJson());

      await storeTipoDespesa.save(storeTipoDespesa.param);

      var result = storeTipoDespesa.resSave;

      expect(result, tipodespesaModel);
    });

    test('Update complete flow', () async {
      await storeTipoDespesa.changeTipoDespesa(tipodespesaModel);

      await mockUpdate(storeTipoDespesa.param.toJson());

      await storeTipoDespesa.save(storeTipoDespesa.param);

      var result = storeTipoDespesa.resSave;

      expect(result, tipodespesaModel);
    });

    test('Delete complete flow', () async {
      await storeTipoDespesa.changeTipoDespesa(tipodespesaModel);

      await mockDelete(storeTipoDespesa.param);

      await storeTipoDespesa.delete(storeTipoDespesa.param);

      expect(storeTipoDespesa.loadingStore.loadState, EnumLoadState.loaded);
    });
  });
  mockTipoDespesaApiDisconnected(() {
    test('Find complete flow', () async {
      await storeTipoDespesa.changeTipoDespesa(tipodespesaModel);

      await mockfindById();

      await storeTipoDespesa.find(storeTipoDespesa.param);

      expect(
        storeTipoDespesa.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storeTipoDespesa.list();

      expect(
        storeTipoDespesa.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeTipoDespesa.changePagination(newPagination: pagination);

      await storeTipoDespesa.listPage();

      expect(
        storeTipoDespesa.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storeTipoDespesa.changeTipoDespesa(tipodespesaModel);

      await mockSave(storeTipoDespesa.param.toJson());

      await storeTipoDespesa.save(storeTipoDespesa.param);

      expect(
        storeTipoDespesa.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storeTipoDespesa.changeTipoDespesa(tipodespesaModel);

      await mockUpdate(storeTipoDespesa.param.toJson());

      await storeTipoDespesa.save(storeTipoDespesa.param);

      expect(
        storeTipoDespesa.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storeTipoDespesa.changeTipoDespesa(tipodespesaModel);

      await mockDelete(storeTipoDespesa.param);

      await storeTipoDespesa.delete(storeTipoDespesa.param);

      expect(
        storeTipoDespesa.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
