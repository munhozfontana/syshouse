import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/dependente_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/dependente_model.dart';
import 'package:syshouse/app/data/repositories/dependente_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/dependente_usecases.dart';
import 'package:syshouse/app/presentation/mobx/dependente_store.dart';
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
  StoreDependente storeDependente;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var dependenteJson = fixture("dependente.json");
  var dependenteModel = DependenteModel.fromJson(json.decode(dependenteJson));

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

    var dependenteRepository = DependenteRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      dependenteApi: DependenteApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeDependente = StoreDependente(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      saveDependente: SaveDependente(
        dependenteRepository: dependenteRepository,
      ),
      findDependente: FindDependente(
        dependenteRepository: dependenteRepository,
      ),
      listDependente: ListDependente(
        dependenteRepository: dependenteRepository,
      ),
      listPageDependente: ListPageDependente(
        dependenteRepository: dependenteRepository,
      ),
      deleteDependente: DeleteDependente(
        dependenteRepository: dependenteRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: dependenteJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$dependenteJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$dependenteJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: dependenteJson, statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$dependenteJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockDependenteApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockDependenteApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockDependenteApiConnected(() {
    test('Find complete flow', () async {
      await storeDependente.changeDependente(dependenteModel);

      await mockfindById();

      await storeDependente.find(storeDependente.param);

      var result = await storeDependente.resFind;

      expect(result, dependenteModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storeDependente.list();

      var result = await storeDependente.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeDependente.changePagination(newPagination: pagination);

      await storeDependente.listPage();

      var result = await storeDependente.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storeDependente.changeDependente(dependenteModel);

      await mockSave(storeDependente.param.toJson());

      await storeDependente.save(storeDependente.param);

      var result = storeDependente.resSave;

      expect(result, dependenteModel);
    });

    test('Update complete flow', () async {
      await storeDependente.changeDependente(dependenteModel);

      await mockUpdate(storeDependente.param.toJson());

      await storeDependente.save(storeDependente.param);

      var result = storeDependente.resSave;

      expect(result, dependenteModel);
    });

    test('Delete complete flow', () async {
      await storeDependente.changeDependente(dependenteModel);

      await mockDelete(storeDependente.param);

      await storeDependente.delete(storeDependente.param);

      expect(storeDependente.loadingStore.loadState, EnumLoadState.loaded);
    });
  });
  mockDependenteApiDisconnected(() {
    test('Find complete flow', () async {
      await storeDependente.changeDependente(dependenteModel);

      await mockfindById();

      await storeDependente.find(storeDependente.param);

      expect(
        storeDependente.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storeDependente.list();

      expect(
        storeDependente.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeDependente.changePagination(newPagination: pagination);

      await storeDependente.listPage();

      expect(
        storeDependente.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storeDependente.changeDependente(dependenteModel);

      await mockSave(storeDependente.param.toJson());

      await storeDependente.save(storeDependente.param);

      expect(
        storeDependente.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storeDependente.changeDependente(dependenteModel);

      await mockUpdate(storeDependente.param.toJson());

      await storeDependente.save(storeDependente.param);

      expect(
        storeDependente.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storeDependente.changeDependente(dependenteModel);

      await mockDelete(storeDependente.param);

      await storeDependente.delete(storeDependente.param);

      expect(
        storeDependente.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
