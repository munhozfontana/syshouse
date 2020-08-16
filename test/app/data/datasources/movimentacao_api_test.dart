import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/movimentacao_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/movimentacao_model.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/network/http_adapter.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockDatasourcesApiValidation extends Mock
    implements DatasourcesApiValidation {}

void main() {
  MovimentacaoApiImpl movimentacaoApi;

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

  var movimentacaoJson = fixture("movimentacao.json");
  var body = MovimentacaoModel.fromJson(json.decode(movimentacaoJson));
  var id = body.id;

  setUp(() {
    mockDatasourcesApiValidation = MockDatasourcesApiValidation();
    mockHttpAdapter = MockHttpAdapter();
    movimentacaoApi = MovimentacaoApiImpl(
      httpAdapterImpl: mockHttpAdapter,
      apiValidation: mockDatasourcesApiValidation,
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async => ResponseAdapter(
        body: movimentacaoJson, statusCode: 200, header: header));
  }

  void mocklist() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$movimentacaoJson]", statusCode: 200, header: header));
  }

  void mocklistPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$movimentacaoJson]", statusCode: 200, header: header));
  }

  void mockSave(Object body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(Object body) {
    when(mockHttpAdapter.save(body)).thenAnswer((_) async => ResponseAdapter(
        body: "$movimentacaoJson", statusCode: 200, header: header));
  }

  void mockInternalServerErrorException(Function body) {
    group('throw InternalServerErrorException', () {
      setUp(() {
        when(movimentacaoApi.apiValidation.validate(any))
            .thenThrow(InternalServerApiException());
      });

      body();
    });
  }

  void mockClientServerErrorException(Function body) {
    group('throw ClientServerErrorException', () {
      setUp(() {
        when(movimentacaoApi.apiValidation.validate(any))
            .thenThrow(ClientServerApiException());
      });

      body();
    });
  }

  test("find one by id", () async {
    mockfindById();

    var res = await movimentacaoApi.find(id);

    expect(res.id, id);
  });

  test("list all", () async {
    mocklist();

    var res = await movimentacaoApi.list();

    expect(res[0].id, id);
  });

  test("list All by Page", () async {
    mocklistPage(0, 5);

    var res = await movimentacaoApi.listPage(0, 5);

    expect(res[0].id, id);
  });

  test('save (new)', () async {
    mockSave(body.toJson());

    var res = await movimentacaoApi.save(body.toJson());

    expect(res, MovimentacaoModel());
  });

  test('save (update)', () async {
    mockUpdate(body.toJson());

    MovimentacaoModel res = await movimentacaoApi.save(body.toJson());

    expect(res, body);
  });

  test('remove', () async {
    await movimentacaoApi.delete(id);
  });

  group('check throws', () {
    mockClientServerErrorException(() {
      test("find one by id", () async {
        mockfindById();

        expect(
            movimentacaoApi.find(id),
            throwsA(
              isA<ClientServerApiException>(),
            ));
      });

      test("list all", () async {
        mocklist();

        expect(
            movimentacaoApi.list(),
            throwsA(
              isA<ClientServerApiException>(),
            ));
      });

      test("list All by Page", () async {
        mocklistPage(0, 5);

        expect(
          movimentacaoApi.listPage(0, 5),
          throwsA(
            isA<ClientServerApiException>(),
          ),
        );
      });

      test('save (new)', () async {
        mockSave(body.toJson());

        expect(
            movimentacaoApi.save(body.toJson()),
            throwsA(
              isA<ClientServerApiException>(),
            ));
      });

      test('save (update)', () async {
        mockUpdate(body.toJson());

        expect(
            movimentacaoApi.save(body.toJson()),
            throwsA(
              isA<ClientServerApiException>(),
            ));
      });

      test('remove', () async {
        expect(
            movimentacaoApi.delete(id),
            throwsA(
              isA<ClientServerApiException>(),
            ));
      });
    });

    mockInternalServerErrorException(() {
      test("find one by id", () async {
        mockfindById();

        expect(
            movimentacaoApi.find(id),
            throwsA(
              isA<InternalServerApiException>(),
            ));
      });

      test("list all", () async {
        mocklist();

        expect(
            movimentacaoApi.list(),
            throwsA(
              isA<InternalServerApiException>(),
            ));
      });

      test("list All by Page", () async {
        mocklistPage(0, 5);

        expect(
          movimentacaoApi.listPage(0, 5),
          throwsA(
            isA<InternalServerApiException>(),
          ),
        );
      });

      test('save (new)', () async {
        mockSave(body.toJson());

        expect(
            movimentacaoApi.save(body.toJson()),
            throwsA(
              isA<InternalServerApiException>(),
            ));
      });

      test('save (update)', () async {
        mockUpdate(body.toJson());

        expect(
            movimentacaoApi.save(body.toJson()),
            throwsA(
              isA<InternalServerApiException>(),
            ));
      });

      test('remove', () async {
        expect(
            movimentacaoApi.delete(id),
            throwsA(
              isA<InternalServerApiException>(),
            ));
      });
    });
  });
}
