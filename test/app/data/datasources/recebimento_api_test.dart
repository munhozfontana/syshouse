import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/recebimento_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/recebimento_model.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/network/http_adapter.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockDatasourcesApiValidation extends Mock
    implements DatasourcesApiValidation {}

void main() {
  RecebimentoApiImpl recebimentoApi;

  MockDatasourcesApiValidation mockDatasourcesApiValidation;
  MockHttpAdapter mockHttpAdapter;

  var header = {
    'connection': 'keep-alive',
    'content-length': '629',
    'content-type': 'application/json',
    'date': 'Sat, 18 Jul 2020 14:57:29 GMT',
    'server': 'Cowboy',
    'via': '1.1 vegur',
  };

  var recebimentoJson = fixture("recebimento.json");
  var body = RecebimentoModel.fromJson(json.decode(recebimentoJson));
  var id = body.id;

  setUp(() {
    mockDatasourcesApiValidation = MockDatasourcesApiValidation();
    mockHttpAdapter = MockHttpAdapter();
    recebimentoApi = RecebimentoApiImpl(
      httpAdapterImpl: mockHttpAdapter,
      apiValidation: mockDatasourcesApiValidation,
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: recebimentoJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$recebimentoJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$recebimentoJson]", statusCode: 200, header: header));
  }

  void mockSave(Object body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Object body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$recebimentoJson", statusCode: 200, header: header));
  }

  void mockInternalServerErrorException(Function body) {
    group('throw InternalServerErrorException', () {
      setUp(() {
        when(recebimentoApi.apiValidation.validate(any))
            .thenThrow(InternalServerApiException());
      });

      body();
    });
  }

  void mockClientServerErrorException(Function body) {
    group('throw ClientServerErrorException', () {
      setUp(() {
        when(recebimentoApi.apiValidation.validate(any))
            .thenThrow(ClientServerApiException());
      });

      body();
    });
  }

  test("find one by id", () async {
    mockfindById();

    var res = await recebimentoApi.find(id);

    expect(res.id, id);
  });

  test("list all", () async {
    mocklist();

    var res = await recebimentoApi.list();

    expect(res[0].id, id);
  });

  test("list All by Page", () async {
    mocklistPage(0, 5);

    var res = await recebimentoApi.listPage(0, 5);

    expect(res[0].id, id);
  });

  test('save (new)', () async {
    mockSave(body.toJson());

    var res = await recebimentoApi.save(body.toJson());

    expect(res, RecebimentoModel());
  });

  test('save (update)', () async {
    mockUpdate(body.toJson());

    RecebimentoModel res = await recebimentoApi.save(body.toJson());

    expect(res, body);
  });

  test('remove', () async {
    await recebimentoApi.delete(id);
  });

  group('check throws', () {
    mockClientServerErrorException(() {
      test("find one by id", () async {
        mockfindById();

        expect(
            recebimentoApi.find(id),
            throwsA(
              isA<ClientServerApiException>(),
            ));
      });

      test("list all", () async {
        mocklist();

        expect(
            recebimentoApi.list(),
            throwsA(
              isA<ClientServerApiException>(),
            ));
      });

      test("list All by Page", () async {
        mocklistPage(0, 5);

        expect(
          recebimentoApi.listPage(0, 5),
          throwsA(
            isA<ClientServerApiException>(),
          ),
        );
      });

      test('save (new)', () async {
        mockSave(body.toJson());

        expect(
            recebimentoApi.save(body.toJson()),
            throwsA(
              isA<ClientServerApiException>(),
            ));
      });

      test('save (update)', () async {
        mockUpdate(body.toJson());

        expect(
            recebimentoApi.save(body.toJson()),
            throwsA(
              isA<ClientServerApiException>(),
            ));
      });

      test('remove', () async {
        expect(
            recebimentoApi.delete(id),
            throwsA(
              isA<ClientServerApiException>(),
            ));
      });
    });

    mockInternalServerErrorException(() {
      test("find one by id", () async {
        mockfindById();

        expect(
            recebimentoApi.find(id),
            throwsA(
              isA<InternalServerApiException>(),
            ));
      });

      test("list all", () async {
        mocklist();

        expect(
            recebimentoApi.list(),
            throwsA(
              isA<InternalServerApiException>(),
            ));
      });

      test("list All by Page", () async {
        mocklistPage(0, 5);

        expect(
          recebimentoApi.listPage(0, 5),
          throwsA(
            isA<InternalServerApiException>(),
          ),
        );
      });

      test('save (new)', () async {
        mockSave(body.toJson());

        expect(
            recebimentoApi.save(body.toJson()),
            throwsA(
              isA<InternalServerApiException>(),
            ));
      });

      test('save (update)', () async {
        mockUpdate(body.toJson());

        expect(
            recebimentoApi.save(body.toJson()),
            throwsA(
              isA<InternalServerApiException>(),
            ));
      });

      test('remove', () async {
        expect(
            recebimentoApi.delete(id),
            throwsA(
              isA<InternalServerApiException>(),
            ));
      });
    });
  });
}
