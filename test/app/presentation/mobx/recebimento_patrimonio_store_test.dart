import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/recebimento_patrimonio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/recebimento_patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/recebimento_patrimonio_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/recebimento_patrimonio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/recebimento_patrimonio_store.dart';
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
  StoreRecebimentoPatrimonio storeRecebimentoPatrimonio;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var recebimentopatrimonioJson = fixture("recebimento_patrimonio.json");
  var recebimentopatrimonioModel = RecebimentoPatrimonioModel.fromJson(
      json.decode(recebimentopatrimonioJson));

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

    var recebimentoPatrimonioRepository = RecebimentoPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      recebimentopatrimonioApi: RecebimentoPatrimonioApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeRecebimentoPatrimonio = StoreRecebimentoPatrimonio(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      saveRecebimentoPatrimonio: SaveRecebimentoPatrimonio(
        recebimentopatrimonioRepository: recebimentoPatrimonioRepository,
      ),
      findRecebimentoPatrimonio: FindRecebimentoPatrimonio(
        recebimentopatrimonioRepository: recebimentoPatrimonioRepository,
      ),
      listRecebimentoPatrimonio: ListRecebimentoPatrimonio(
        recebimentopatrimonioRepository: recebimentoPatrimonioRepository,
      ),
      listPageRecebimentoPatrimonio: ListPageRecebimentoPatrimonio(
        recebimentopatrimonioRepository: recebimentoPatrimonioRepository,
      ),
      deleteRecebimentoPatrimonio: DeleteRecebimentoPatrimonio(
        recebimentopatrimonioRepository: recebimentoPatrimonioRepository,
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
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: recebimentopatrimonioJson, statusCode: 201, header: header));
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
          .changeRecebimentoPatrimonio(recebimentopatrimonioModel);

      await mockfindById();

      await storeRecebimentoPatrimonio.find(storeRecebimentoPatrimonio.param);

      var result = await storeRecebimentoPatrimonio.resFind;

      expect(result, recebimentopatrimonioModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storeRecebimentoPatrimonio.list();

      var result = await storeRecebimentoPatrimonio.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeRecebimentoPatrimonio.changePagination(
          newPagination: pagination);

      await storeRecebimentoPatrimonio.listPage();

      var result = await storeRecebimentoPatrimonio.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentopatrimonioModel);

      await mockSave(storeRecebimentoPatrimonio.param.toJson());

      await storeRecebimentoPatrimonio.save(storeRecebimentoPatrimonio.param);

      var result = storeRecebimentoPatrimonio.resSave;

      expect(result, recebimentopatrimonioModel);
    });

    test('Update complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentopatrimonioModel);

      await mockUpdate(storeRecebimentoPatrimonio.param.toJson());

      await storeRecebimentoPatrimonio.save(storeRecebimentoPatrimonio.param);

      var result = storeRecebimentoPatrimonio.resSave;

      expect(result, recebimentopatrimonioModel);
    });

    test('Delete complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentopatrimonioModel);

      await mockDelete(storeRecebimentoPatrimonio.param);

      await storeRecebimentoPatrimonio.delete(storeRecebimentoPatrimonio.param);

      expect(storeRecebimentoPatrimonio.loadingStore.loadState,
          EnumLoadState.loaded);
    });
  });
  mockRecebimentoPatrimonioApiDisconnected(() {
    test('Find complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentopatrimonioModel);

      await mockfindById();

      await storeRecebimentoPatrimonio.find(storeRecebimentoPatrimonio.param);

      expect(
        storeRecebimentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storeRecebimentoPatrimonio.list();

      expect(
        storeRecebimentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeRecebimentoPatrimonio.changePagination(
          newPagination: pagination);

      await storeRecebimentoPatrimonio.listPage();

      expect(
        storeRecebimentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentopatrimonioModel);

      await mockSave(storeRecebimentoPatrimonio.param.toJson());

      await storeRecebimentoPatrimonio.save(storeRecebimentoPatrimonio.param);

      expect(
        storeRecebimentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentopatrimonioModel);

      await mockUpdate(storeRecebimentoPatrimonio.param.toJson());

      await storeRecebimentoPatrimonio.save(storeRecebimentoPatrimonio.param);

      expect(
        storeRecebimentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storeRecebimentoPatrimonio
          .changeRecebimentoPatrimonio(recebimentopatrimonioModel);

      await mockDelete(storeRecebimentoPatrimonio.param);

      await storeRecebimentoPatrimonio.delete(storeRecebimentoPatrimonio.param);

      expect(
        storeRecebimentoPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
