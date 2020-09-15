import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/socio_patrimonio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/socio_patrimonio_model.dart';
import 'package:syshouse/app/data/repositories/socio_patrimonio_repository_impl.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/app/domain/usecases/socio_patrimonio_usecases.dart';
import 'package:syshouse/app/presentation/mobx/shared/enuns/enum_load_state.dart';
import 'package:syshouse/app/presentation/mobx/shared/loading_store.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';
import 'package:syshouse/app/presentation/mobx/socio_patrimonio_store.dart';
import 'package:syshouse/core/network/connectivity_adapter.dart';
import 'package:syshouse/core/network/http_adapter.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockConnectivityAdapter extends Mock implements ConnectivityAdapter {}

void main() {
  StoreSocioPatrimonio storeSocioPatrimonio;
  MockConnectivityAdapter mockConnectivityAdapter;
  MockHttpAdapter mockHttpAdapter;
  Pagination pagination;
  var sociopatrimonioJson = fixture("socio_patrimonio.json");
  var sociopatrimonioModel =
      SocioPatrimonioModel.fromJson(json.decode(sociopatrimonioJson));

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

    var socioPatrimonioRepository = SocioPatrimonioRepositoryImpl(
      connectivityAdapter: mockConnectivityAdapter,
      sociopatrimonioApi: SocioPatrimonioApiImpl(
        httpAdapter: mockHttpAdapter,
        apiValidation: ApiValidationImpl(),
      ),
    );

    storeSocioPatrimonio = StoreSocioPatrimonio(
      loadingStore: LoadingStore(),
      showError: ShowError(),
      saveSocioPatrimonio: SaveSocioPatrimonio(
        sociopatrimonioRepository: socioPatrimonioRepository,
      ),
      findSocioPatrimonio: FindSocioPatrimonio(
        sociopatrimonioRepository: socioPatrimonioRepository,
      ),
      listSocioPatrimonio: ListSocioPatrimonio(
        sociopatrimonioRepository: socioPatrimonioRepository,
      ),
      listPageSocioPatrimonio: ListPageSocioPatrimonio(
        sociopatrimonioRepository: socioPatrimonioRepository,
      ),
      deleteSocioPatrimonio: DeleteSocioPatrimonio(
        sociopatrimonioRepository: socioPatrimonioRepository,
      ),
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: sociopatrimonioJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$sociopatrimonioJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$sociopatrimonioJson]", statusCode: 200, header: header));
  }

  void mockSave(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: sociopatrimonioJson, statusCode: 201, header: header));
  }

  void mockUpdate(Map<String, Object> body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$sociopatrimonioJson", statusCode: 200, header: header));
  }

  void mockDelete(Object body) {
    when(mockHttpAdapter.delete(any)).thenAnswer((_) async =>
        ResponseAdapter(body: "{}", statusCode: 204, header: header));
  }

  void mockSocioPatrimonioApiConnected(Function body) {
    group('is Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void mockSocioPatrimonioApiDisconnected(Function body) {
    group('is not Connected', () {
      setUp(() {
        when(mockConnectivityAdapter.isConnected).thenAnswer((_) async => null);
      });
      body();
    });
  }

  mockSocioPatrimonioApiConnected(() {
    test('Find complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(sociopatrimonioModel);

      await mockfindById();

      await storeSocioPatrimonio.find(storeSocioPatrimonio.param);

      var result = await storeSocioPatrimonio.resFind;

      expect(result, sociopatrimonioModel);
    });

    test('List complete flow', () async {
      await mocklist();

      await storeSocioPatrimonio.list();

      var result = await storeSocioPatrimonio.reslist;

      expect(result.length, 1);
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeSocioPatrimonio.changePagination(newPagination: pagination);

      await storeSocioPatrimonio.listPage();

      var result = await storeSocioPatrimonio.reslistPage;

      expect(result.length, 1);
    });
    test('Save complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(sociopatrimonioModel);

      await mockSave(storeSocioPatrimonio.param.toJson());

      await storeSocioPatrimonio.save(storeSocioPatrimonio.param);

      var result = storeSocioPatrimonio.resSave;

      expect(result, sociopatrimonioModel);
    });

    test('Update complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(sociopatrimonioModel);

      await mockUpdate(storeSocioPatrimonio.param.toJson());

      await storeSocioPatrimonio.save(storeSocioPatrimonio.param);

      var result = storeSocioPatrimonio.resSave;

      expect(result, sociopatrimonioModel);
    });

    test('Delete complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(sociopatrimonioModel);

      await mockDelete(storeSocioPatrimonio.param);

      await storeSocioPatrimonio.delete(storeSocioPatrimonio.param);

      expect(storeSocioPatrimonio.loadingStore.loadState, EnumLoadState.loaded);
    });
  });
  mockSocioPatrimonioApiDisconnected(() {
    test('Find complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(sociopatrimonioModel);

      await mockfindById();

      await storeSocioPatrimonio.find(storeSocioPatrimonio.param);

      expect(
        storeSocioPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('List complete flow', () async {
      await mocklist();

      await storeSocioPatrimonio.list();

      expect(
        storeSocioPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('ListPage complete flow', () async {
      await mocklistPage(pagination.page, pagination.size);

      await storeSocioPatrimonio.changePagination(newPagination: pagination);

      await storeSocioPatrimonio.listPage();

      expect(
        storeSocioPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
    test('Save complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(sociopatrimonioModel);

      await mockSave(storeSocioPatrimonio.param.toJson());

      await storeSocioPatrimonio.save(storeSocioPatrimonio.param);

      expect(
        storeSocioPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Update complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(sociopatrimonioModel);

      await mockUpdate(storeSocioPatrimonio.param.toJson());

      await storeSocioPatrimonio.save(storeSocioPatrimonio.param);

      expect(
        storeSocioPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });

    test('Delete complete flow', () async {
      await storeSocioPatrimonio.changeSocioPatrimonio(sociopatrimonioModel);

      await mockDelete(storeSocioPatrimonio.param);

      await storeSocioPatrimonio.delete(storeSocioPatrimonio.param);

      expect(
        storeSocioPatrimonio.showError.getMessageError,
        MessagesRepository.noConnection.value,
      );
    });
  });
}
