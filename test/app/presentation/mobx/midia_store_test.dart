import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/midia_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/midia_model.dart';
import 'package:syshouse/app/data/repositories/midia_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/midia_usecases.dart';
import 'package:syshouse/app/presentation/mobx/midia_store.dart';
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
  StoreMidia storeMidia;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var midiaJson = fixture("midia.json");
  var midiaModel = MidiaModel.fromJson(json.decode(midiaJson));

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

    var midiaRepository = MidiaRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      midiaApi: MidiaApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeMidia = StoreMidia(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      saveMidia: SaveMidia(
        midiaRepository: midiaRepository,
      ),
      findMidia: FindMidia(
        midiaRepository: midiaRepository,
      ),
      listMidia: ListMidia(
        midiaRepository: midiaRepository,
      ),
      listPageMidia: ListPageMidia(
        midiaRepository: midiaRepository,
      ),
      deleteMidia: DeleteMidia(
        midiaRepository: midiaRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: midiaJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async =>
        ResponseAdapter(body: "[$midiaJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(body: "[$midiaJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: midiaJson, statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "$midiaJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockMidiaApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockMidiaApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockMidiaApiConnected(() {
    test('Find complete flow', () async {
      await storeMidia.changeMidia(midiaModel);

      await mockfindById();

      await storeMidia.find(storeMidia.param);

      var result = await storeMidia.resFind;

      expect(result, midiaModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storeMidia.list();

      var result = await storeMidia.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeMidia.changePagination(newPagination: pagination);

      await storeMidia.listPage();

      var result = await storeMidia.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storeMidia.changeMidia(midiaModel);

      await mockSave(storeMidia.param.toJson());

      await storeMidia.save(storeMidia.param);

      var result = storeMidia.resSave;

      expect(result, midiaModel);
    });

    test('Update complete flow', () async {
      await storeMidia.changeMidia(midiaModel);

      await mockUpdate(storeMidia.param.toJson());

      await storeMidia.save(storeMidia.param);

      var result = storeMidia.resSave;

      expect(result, midiaModel);
    });

    test('Delete complete flow', () async {
      await storeMidia.changeMidia(midiaModel);

      await mockDelete(storeMidia.param);

      await storeMidia.delete(storeMidia.param);

      expect(storeMidia.loadingStore.loadState, EnumLoadState.loaded);
    });
  });
  mockMidiaApiDisconnected(() {
    test('Find complete flow', () async {
      await storeMidia.changeMidia(midiaModel);

      await mockfindById();

      await storeMidia.find(storeMidia.param);

      expect(
        storeMidia.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storeMidia.list();

      expect(
        storeMidia.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeMidia.changePagination(newPagination: pagination);

      await storeMidia.listPage();

      expect(
        storeMidia.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storeMidia.changeMidia(midiaModel);

      await mockSave(storeMidia.param.toJson());

      await storeMidia.save(storeMidia.param);

      expect(
        storeMidia.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storeMidia.changeMidia(midiaModel);

      await mockUpdate(storeMidia.param.toJson());

      await storeMidia.save(storeMidia.param);

      expect(
        storeMidia.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storeMidia.changeMidia(midiaModel);

      await mockDelete(storeMidia.param);

      await storeMidia.delete(storeMidia.param);

      expect(
        storeMidia.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
