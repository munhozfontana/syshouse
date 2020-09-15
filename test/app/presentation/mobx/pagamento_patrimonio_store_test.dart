import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/pagamento_patrimonio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/pagamento_patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/pagamento_patrimonio_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/pagamento_patrimonio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/pagamento_patrimonio_store.dart';
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
  StorePagamentoPatrimonio storePagamentoPatrimonio;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var pagamentopatrimonioJson = fixture("pagamento_patrimonio.json");
  var pagamentopatrimonioModel =
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

    var pagamentoPatrimonioRepository = PagamentoPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      pagamentopatrimonioApi: PagamentoPatrimonioApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storePagamentoPatrimonio = StorePagamentoPatrimonio(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      savePagamentoPatrimonio: SavePagamentoPatrimonio(
        pagamentopatrimonioRepository: pagamentoPatrimonioRepository,
      ),
      findPagamentoPatrimonio: FindPagamentoPatrimonio(
        pagamentopatrimonioRepository: pagamentoPatrimonioRepository,
      ),
      listPagamentoPatrimonio: ListPagamentoPatrimonio(
        pagamentopatrimonioRepository: pagamentoPatrimonioRepository,
      ),
      listPagePagamentoPatrimonio: ListPagePagamentoPatrimonio(
        pagamentopatrimonioRepository: pagamentoPatrimonioRepository,
      ),
      deletePagamentoPatrimonio: DeletePagamentoPatrimonio(
        pagamentopatrimonioRepository: pagamentoPatrimonioRepository,
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
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: pagamentopatrimonioJson, statusCode: 201, header: header));
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
          .changePagamentoPatrimonio(pagamentopatrimonioModel);

      await mockfindById();

      await storePagamentoPatrimonio.find(storePagamentoPatrimonio.param);

      var result = await storePagamentoPatrimonio.resFind;

      expect(result, pagamentopatrimonioModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storePagamentoPatrimonio.list();

      var result = await storePagamentoPatrimonio.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storePagamentoPatrimonio.changePagination(
          newPagination: pagination);

      await storePagamentoPatrimonio.listPage();

      var result = await storePagamentoPatrimonio.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentopatrimonioModel);

      await mockSave(storePagamentoPatrimonio.param.toJson());

      await storePagamentoPatrimonio.save(storePagamentoPatrimonio.param);

      var result = storePagamentoPatrimonio.resSave;

      expect(result, pagamentopatrimonioModel);
    });

    test('Update complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentopatrimonioModel);

      await mockUpdate(storePagamentoPatrimonio.param.toJson());

      await storePagamentoPatrimonio.save(storePagamentoPatrimonio.param);

      var result = storePagamentoPatrimonio.resSave;

      expect(result, pagamentopatrimonioModel);
    });

    test('Delete complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentopatrimonioModel);

      await mockDelete(storePagamentoPatrimonio.param);

      await storePagamentoPatrimonio.delete(storePagamentoPatrimonio.param);

      expect(storePagamentoPatrimonio.loadingStore.loadState,
          EnumLoadState.loaded);
    });
  });
  mockPagamentoPatrimonioApiDisconnected(() {
    test('Find complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentopatrimonioModel);

      await mockfindById();

      await storePagamentoPatrimonio.find(storePagamentoPatrimonio.param);

      expect(
        storePagamentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storePagamentoPatrimonio.list();

      expect(
        storePagamentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storePagamentoPatrimonio.changePagination(
          newPagination: pagination);

      await storePagamentoPatrimonio.listPage();

      expect(
        storePagamentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentopatrimonioModel);

      await mockSave(storePagamentoPatrimonio.param.toJson());

      await storePagamentoPatrimonio.save(storePagamentoPatrimonio.param);

      expect(
        storePagamentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentopatrimonioModel);

      await mockUpdate(storePagamentoPatrimonio.param.toJson());

      await storePagamentoPatrimonio.save(storePagamentoPatrimonio.param);

      expect(
        storePagamentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storePagamentoPatrimonio
          .changePagamentoPatrimonio(pagamentopatrimonioModel);

      await mockDelete(storePagamentoPatrimonio.param);

      await storePagamentoPatrimonio.delete(storePagamentoPatrimonio.param);

      expect(
        storePagamentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
