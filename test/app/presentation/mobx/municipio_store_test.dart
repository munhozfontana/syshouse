import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/municipio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/data/repositories/municipio_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/municipio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/municipio_store.dart';
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
  StoreMunicipio storeMunicipio;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var municipioJson = fixture("municipio.json");
  var municipioModel = MunicipioModel.fromJson(json.decode(municipioJson));

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

    var municipioRepository = MunicipioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      municipioApi: MunicipioApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeMunicipio = StoreMunicipio(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      saveMunicipio: SaveMunicipio(
        municipioRepository: municipioRepository,
      ),
      findMunicipio: FindMunicipio(
        municipioRepository: municipioRepository,
      ),
      listMunicipio: ListMunicipio(
        municipioRepository: municipioRepository,
      ),
      listPageMunicipio: ListPageMunicipio(
        municipioRepository: municipioRepository,
      ),
      deleteMunicipio: DeleteMunicipio(
        municipioRepository: municipioRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: municipioJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$municipioJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$municipioJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: municipioJson, statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$municipioJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockMunicipioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockMunicipioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockMunicipioApiConnected(() {
    test('Find complete flow', () async {
      await storeMunicipio.changeMunicipio(municipioModel);

      await mockfindById();

      await storeMunicipio.find(storeMunicipio.param);

      var result = await storeMunicipio.resFind;

      expect(result, municipioModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storeMunicipio.list();

      var result = await storeMunicipio.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeMunicipio.changePagination(newPagination: pagination);

      await storeMunicipio.listPage();

      var result = await storeMunicipio.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storeMunicipio.changeMunicipio(municipioModel);

      await mockSave(storeMunicipio.param.toJson());

      await storeMunicipio.save(storeMunicipio.param);

      var result = storeMunicipio.resSave;

      expect(result, municipioModel);
    });

    test('Update complete flow', () async {
      await storeMunicipio.changeMunicipio(municipioModel);

      await mockUpdate(storeMunicipio.param.toJson());

      await storeMunicipio.save(storeMunicipio.param);

      var result = storeMunicipio.resSave;

      expect(result, municipioModel);
    });

    test('Delete complete flow', () async {
      await storeMunicipio.changeMunicipio(municipioModel);

      await mockDelete(storeMunicipio.param);

      await storeMunicipio.delete(storeMunicipio.param);

      expect(storeMunicipio.loadingStore.loadState, EnumLoadState.loaded);
    });
  });
  mockMunicipioApiDisconnected(() {
    test('Find complete flow', () async {
      await storeMunicipio.changeMunicipio(municipioModel);

      await mockfindById();

      await storeMunicipio.find(storeMunicipio.param);

      expect(
        storeMunicipio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storeMunicipio.list();

      expect(
        storeMunicipio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeMunicipio.changePagination(newPagination: pagination);

      await storeMunicipio.listPage();

      expect(
        storeMunicipio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storeMunicipio.changeMunicipio(municipioModel);

      await mockSave(storeMunicipio.param.toJson());

      await storeMunicipio.save(storeMunicipio.param);

      expect(
        storeMunicipio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storeMunicipio.changeMunicipio(municipioModel);

      await mockUpdate(storeMunicipio.param.toJson());

      await storeMunicipio.save(storeMunicipio.param);

      expect(
        storeMunicipio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storeMunicipio.changeMunicipio(municipioModel);

      await mockDelete(storeMunicipio.param);

      await storeMunicipio.delete(storeMunicipio.param);

      expect(
        storeMunicipio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
