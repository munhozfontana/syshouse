import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/contato_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/contato_model.dart';
import 'package:syshouse/app/data/repositories/contato_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/contato_usecases.dart';
import 'package:syshouse/app/presentation/mobx/contato_store.dart';
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
  StoreContato storeContato;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var contatoJson = fixture("contato.json");
  var contatoModel = ContatoModel.fromJson(json.decode(contatoJson));

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

    var contatoRepository = ContatoRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      contatoApi: ContatoApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeContato = StoreContato(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      saveContato: SaveContato(
        contatoRepository: contatoRepository,
      ),
      findContato: FindContato(
        contatoRepository: contatoRepository,
      ),
      listContato: ListContato(
        contatoRepository: contatoRepository,
      ),
      listPageContato: ListPageContato(
        contatoRepository: contatoRepository,
      ),
      deleteContato: DeleteContato(
        contatoRepository: contatoRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: contatoJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$contatoJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$contatoJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: contatoJson, statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "$contatoJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockContatoApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockContatoApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockContatoApiConnected(() {
    test('Find complete flow', () async {
      await storeContato.changeContato(contatoModel);

      await mockfindById();

      await storeContato.find(storeContato.param);

      var result = await storeContato.resFind;

      expect(result, contatoModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storeContato.list();

      var result = await storeContato.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeContato.changePagination(newPagination: pagination);

      await storeContato.listPage();

      var result = await storeContato.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storeContato.changeContato(contatoModel);

      await mockSave(storeContato.param.toJson());

      await storeContato.save(storeContato.param);

      var result = storeContato.resSave;

      expect(result, contatoModel);
    });

    test('Update complete flow', () async {
      await storeContato.changeContato(contatoModel);

      await mockUpdate(storeContato.param.toJson());

      await storeContato.save(storeContato.param);

      var result = storeContato.resSave;

      expect(result, contatoModel);
    });

    test('Delete complete flow', () async {
      await storeContato.changeContato(contatoModel);

      await mockDelete(storeContato.param);

      await storeContato.delete(storeContato.param);

      expect(storeContato.loadingStore.loadState, EnumLoadState.loaded);
    });
  });
  mockContatoApiDisconnected(() {
    test('Find complete flow', () async {
      await storeContato.changeContato(contatoModel);

      await mockfindById();

      await storeContato.find(storeContato.param);

      expect(
        storeContato.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storeContato.list();

      expect(
        storeContato.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeContato.changePagination(newPagination: pagination);

      await storeContato.listPage();

      expect(
        storeContato.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storeContato.changeContato(contatoModel);

      await mockSave(storeContato.param.toJson());

      await storeContato.save(storeContato.param);

      expect(
        storeContato.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storeContato.changeContato(contatoModel);

      await mockUpdate(storeContato.param.toJson());

      await storeContato.save(storeContato.param);

      expect(
        storeContato.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storeContato.changeContato(contatoModel);

      await mockDelete(storeContato.param);

      await storeContato.delete(storeContato.param);

      expect(
        storeContato.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
