import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/patrimonio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/patrimonio_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/patrimonio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/patrimonio_store.dart';
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
  StorePatrimonio storePatrimonio;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var patrimonioJson = fixture("patrimonio.json");
  var patrimonioModel = PatrimonioModel.fromJson(json.decode(patrimonioJson));

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

    var patrimonioRepository = PatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      patrimonioApi: PatrimonioApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storePatrimonio = StorePatrimonio(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      savePatrimonio: SavePatrimonio(
        patrimonioRepository: patrimonioRepository,
      ),
      findPatrimonio: FindPatrimonio(
        patrimonioRepository: patrimonioRepository,
      ),
      listPatrimonio: ListPatrimonio(
        patrimonioRepository: patrimonioRepository,
      ),
      listPagePatrimonio: ListPagePatrimonio(
        patrimonioRepository: patrimonioRepository,
      ),
      deletePatrimonio: DeletePatrimonio(
        patrimonioRepository: patrimonioRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: patrimonioJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$patrimonioJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$patrimonioJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: patrimonioJson, statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$patrimonioJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockPatrimonioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockPatrimonioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockPatrimonioApiConnected(() {
    test('Find complete flow', () async {
      await storePatrimonio.changePatrimonio(patrimonioModel);

      await mockfindById();

      await storePatrimonio.find(storePatrimonio.param);

      var result = await storePatrimonio.resFind;

      expect(result, patrimonioModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storePatrimonio.list();

      var result = await storePatrimonio.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storePatrimonio.changePagination(newPagination: pagination);

      await storePatrimonio.listPage();

      var result = await storePatrimonio.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storePatrimonio.changePatrimonio(patrimonioModel);

      await mockSave(storePatrimonio.param.toJson());

      await storePatrimonio.save(storePatrimonio.param);

      var result = storePatrimonio.resSave;

      expect(result, patrimonioModel);
    });

    test('Update complete flow', () async {
      await storePatrimonio.changePatrimonio(patrimonioModel);

      await mockUpdate(storePatrimonio.param.toJson());

      await storePatrimonio.save(storePatrimonio.param);

      var result = storePatrimonio.resSave;

      expect(result, patrimonioModel);
    });

    test('Delete complete flow', () async {
      await storePatrimonio.changePatrimonio(patrimonioModel);

      await mockDelete(storePatrimonio.param);

      await storePatrimonio.delete(storePatrimonio.param);

      expect(storePatrimonio.loadingStore.loadState, EnumLoadState.loaded);
    });
  });
  mockPatrimonioApiDisconnected(() {
    test('Find complete flow', () async {
      await storePatrimonio.changePatrimonio(patrimonioModel);

      await mockfindById();

      await storePatrimonio.find(storePatrimonio.param);

      expect(
        storePatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storePatrimonio.list();

      expect(
        storePatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storePatrimonio.changePagination(newPagination: pagination);

      await storePatrimonio.listPage();

      expect(
        storePatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storePatrimonio.changePatrimonio(patrimonioModel);

      await mockSave(storePatrimonio.param.toJson());

      await storePatrimonio.save(storePatrimonio.param);

      expect(
        storePatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storePatrimonio.changePatrimonio(patrimonioModel);

      await mockUpdate(storePatrimonio.param.toJson());

      await storePatrimonio.save(storePatrimonio.param);

      expect(
        storePatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storePatrimonio.changePatrimonio(patrimonioModel);

      await mockDelete(storePatrimonio.param);

      await storePatrimonio.delete(storePatrimonio.param);

      expect(
        storePatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
