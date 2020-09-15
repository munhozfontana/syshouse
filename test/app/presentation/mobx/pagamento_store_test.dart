import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/pagamento_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/pagamento_model.dart';
import 'package:syshouse/app/data/repositories/pagamento_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/pagamento_usecases.dart';
import 'package:syshouse/app/presentation/mobx/pagamento_store.dart';
import 'package:syshouse/app/presentation/mobx/shared/enuns/enum_load_state.dart';
import 'package:syshouse/app/presentation/mobx/shared/loading_store.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StorePagamento storePagamento;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var pagamentoJson = fixture("pagamento.json");
  var pagamentoModel = PagamentoModel.fromJson(json.decode(pagamentoJson));

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

    var pagamentoRepository = PagamentoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      pagamentoApi: PagamentoApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storePagamento = StorePagamento(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      savePagamento: SavePagamento(
        pagamentoRepository: pagamentoRepository,
      ),
      findPagamento: FindPagamento(
        pagamentoRepository: pagamentoRepository,
      ),
      listPagamento: ListPagamento(
        pagamentoRepository: pagamentoRepository,
      ),
      listPagePagamento: ListPagePagamento(
        pagamentoRepository: pagamentoRepository,
      ),
      deletePagamento: DeletePagamento(
        pagamentoRepository: pagamentoRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: pagamentoJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$pagamentoJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$pagamentoJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: pagamentoJson, statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$pagamentoJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockPagamentoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockPagamentoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockPagamentoApiConnected(() {
    test('Find complete flow', () async {
      await storePagamento.changePagamento(pagamentoModel);

      await mockfindById();

      await storePagamento.find(storePagamento.param);

      var result = await storePagamento.resFind;

      expect(result, pagamentoModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storePagamento.list();

      var result = await storePagamento.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storePagamento.changePagination(newPagination: pagination);

      await storePagamento.listPage();

      var result = await storePagamento.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storePagamento.changePagamento(pagamentoModel);

      await mockSave(storePagamento.param.toJson());

      await storePagamento.save(storePagamento.param);

      var result = storePagamento.resSave;

      expect(result, pagamentoModel);
    });

    test('Update complete flow', () async {
      await storePagamento.changePagamento(pagamentoModel);

      await mockUpdate(storePagamento.param.toJson());

      await storePagamento.save(storePagamento.param);

      var result = storePagamento.resSave;

      expect(result, pagamentoModel);
    });

    test('Delete complete flow', () async {
      await storePagamento.changePagamento(pagamentoModel);

      await mockDelete(storePagamento.param);

      await storePagamento.delete(storePagamento.param);

      expect(storePagamento.loadingStore.loadState, EnumLoadState.loaded);
    });
  });
  mockPagamentoApiDisconnected(() {
    test('Find complete flow', () async {
      await storePagamento.changePagamento(pagamentoModel);

      await mockfindById();

      await storePagamento.find(storePagamento.param);

      expect(
        storePagamento.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storePagamento.list();

      expect(
        storePagamento.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storePagamento.changePagination(newPagination: pagination);

      await storePagamento.listPage();

      expect(
        storePagamento.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storePagamento.changePagamento(pagamentoModel);

      await mockSave(storePagamento.param.toJson());

      await storePagamento.save(storePagamento.param);

      expect(
        storePagamento.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storePagamento.changePagamento(pagamentoModel);

      await mockUpdate(storePagamento.param.toJson());

      await storePagamento.save(storePagamento.param);

      expect(
        storePagamento.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storePagamento.changePagamento(pagamentoModel);

      await mockDelete(storePagamento.param);

      await storePagamento.delete(storePagamento.param);

      expect(
        storePagamento.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
