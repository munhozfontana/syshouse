import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/socio_patrimonio_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/socio_patrimonio_model.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/network/http_adapter.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockDatasourcesApiValidation extends Mock
    implements DatasourcesApiValidation {}

void main() {
  SocioPatrimonioApiImpl sociopatrimonioApi;

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

  var sociopatrimonioJson = fixture("sociopatrimonio.json");
  var body = SocioPatrimonioModel.fromJson(json.decode(sociopatrimonioJson));
  var id = body.id;

  setUp(() {
    mockDatasourcesApiValidation = MockDatasourcesApiValidation();
    mockHttpAdapter = MockHttpAdapter();
    sociopatrimonioApi = SocioPatrimonioApiImpl(
      httpAdapterImpl: mockHttpAdapter,
      apiValidation: mockDatasourcesApiValidation,
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: sociopatrimonioJson, statusCode: 200, header: header));
  }

  void mockListAll() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$sociopatrimonioJson]", statusCode: 200, header: header));
  }

  void mockListAllPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$sociopatrimonioJson]", statusCode: 200, header: header));
  }

  void mockSave(dynamic body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(dynamic body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$sociopatrimonioJson", statusCode: 200, header: header));
  }

  void mockInternalServerErrorException(Function body) {
    group('throw InternalServerErrorException', () {
      setUp(() {
        when(sociopatrimonioApi.apiValidation.validate(any))
            .thenThrow(InternalServerErrorException());
      });

      body();
    });
  }

  void mockClientServerErrorException(Function body) {
    group('throw ClientServerErrorException', () {
      setUp(() {
        when(sociopatrimonioApi.apiValidation.validate(any))
            .thenThrow(ClientServerErrorException());
      });

      body();
    });
  }

  test("find one by id", () async {
    mockfindById();

    var res = await sociopatrimonioApi.find(id);

    expect(res.id, id);
  });

  test("list all", () async {
    mockListAll();

    var res = await sociopatrimonioApi.listAll();

    expect(res[0].id, id);
  });

  test("list All by Page", () async {
    mockListAllPage(0, 5);

    var res = await sociopatrimonioApi.listAllPage(0, 5);

    expect(res[0].id, id);
  });

  test('save (new)', () async {
    mockSave(body.toJson());

    var res = await sociopatrimonioApi.save(body.toJson());

    expect(res, SocioPatrimonioModel());
  });

  test('save (update)', () async {
    mockUpdate(body.toJson());

    SocioPatrimonioModel res = await sociopatrimonioApi.save(body.toJson());

    expect(res, body);
  });

  test('remove', () async {
    await sociopatrimonioApi.delete(id);
  });

  group('check throws', () {
    mockClientServerErrorException(() {
      test("find one by id", () async {
        mockfindById();

        expect(
            sociopatrimonioApi.find(id),
            throwsA(
              isA<ClientServerErrorException>(),
            ));
      });

      test("list all", () async {
        mockListAll();

        expect(
            sociopatrimonioApi.listAll(),
            throwsA(
              isA<ClientServerErrorException>(),
            ));
      });

      test("list All by Page", () async {
        mockListAllPage(0, 5);

        expect(
          sociopatrimonioApi.listAllPage(0, 5),
          throwsA(
            isA<ClientServerErrorException>(),
          ),
        );
      });

      test('save (new)', () async {
        mockSave(body.toJson());

        expect(
            sociopatrimonioApi.save(body.toJson()),
            throwsA(
              isA<ClientServerErrorException>(),
            ));
      });

      test('save (update)', () async {
        mockUpdate(body.toJson());

        expect(
            sociopatrimonioApi.save(body.toJson()),
            throwsA(
              isA<ClientServerErrorException>(),
            ));
      });

      test('remove', () async {
        expect(
            sociopatrimonioApi.delete(id),
            throwsA(
              isA<ClientServerErrorException>(),
            ));
      });
    });

    mockInternalServerErrorException(() {
      test("find one by id", () async {
        mockfindById();

        expect(
            sociopatrimonioApi.find(id),
            throwsA(
              isA<InternalServerErrorException>(),
            ));
      });

      test("list all", () async {
        mockListAll();

        expect(
            sociopatrimonioApi.listAll(),
            throwsA(
              isA<InternalServerErrorException>(),
            ));
      });

      test("list All by Page", () async {
        mockListAllPage(0, 5);

        expect(
          sociopatrimonioApi.listAllPage(0, 5),
          throwsA(
            isA<InternalServerErrorException>(),
          ),
        );
      });

      test('save (new)', () async {
        mockSave(body.toJson());

        expect(
            sociopatrimonioApi.save(body.toJson()),
            throwsA(
              isA<InternalServerErrorException>(),
            ));
      });

      test('save (update)', () async {
        mockUpdate(body.toJson());

        expect(
            sociopatrimonioApi.save(body.toJson()),
            throwsA(
              isA<InternalServerErrorException>(),
            ));
      });

      test('remove', () async {
        expect(
            sociopatrimonioApi.delete(id),
            throwsA(
              isA<InternalServerErrorException>(),
            ));
      });
    });
  });
}