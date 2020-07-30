import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syshouse/app/data/datasources/contato_api.dart';
import 'package:syshouse/app/data/datasources/utils/datasources_api_validation.dart';
import 'package:syshouse/app/data/models/contato_model.dart';
import 'package:syshouse/core/error/exceptions.dart';
import 'package:syshouse/core/network/http_adapter.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpAdapter extends Mock implements HttpAdapter {}

class MockDatasourcesApiValidation extends Mock
    implements DatasourcesApiValidation {}

void main() {
  ContatoApiImpl contatoApi;

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

  var id = "0151cfe8-63d8-424f-ab6f-a84e2c87e7ea";

  var body = <String, dynamic>{
    "email": "string",
    "fone": "string",
    "pagadorId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "socioId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "whatsapp": true
  };

  var bodyObject = ContatoModel(
    id: id,
    email: "string",
    fone: "string",
    pagadorId: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    socioId: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    whatsapp: true,
  );

  var contatoJson = fixture("contato.json");

  setUp(() {
    mockDatasourcesApiValidation = MockDatasourcesApiValidation();
    mockHttpAdapter = MockHttpAdapter();
    contatoApi = ContatoApiImpl(
      httpAdapterImpl: mockHttpAdapter,
      apiValidation: mockDatasourcesApiValidation,
    );
  });

  void mockfindById() {
    when(mockHttpAdapter.findById(any)).thenAnswer((_) async =>
        ResponseAdapter(body: contatoJson, statusCode: 200, header: header));
  }

  void mockListAll() {
    when(mockHttpAdapter.findAll()).thenAnswer((_) async => ResponseAdapter(
        body: "[$contatoJson]", statusCode: 200, header: header));
  }

  void mockListAllPage(int page, int size) {
    when(mockHttpAdapter.findAllByPage(page, size)).thenAnswer((_) async =>
        ResponseAdapter(
            body: "[$contatoJson]", statusCode: 200, header: header));
  }

  void mockSave(dynamic body) {
    //novo 201
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "", statusCode: 201, header: header));
  }

  void mockUpdate(dynamic body) {
    //update 200
    when(mockHttpAdapter.save(body)).thenAnswer((_) async =>
        ResponseAdapter(body: "$contatoJson", statusCode: 200, header: header));
  }

  void mockValidateServerError() {
    when(contatoApi.apiValidation.validate(any))
        .thenThrow(InternalServerErrorException());
  }

  test("find one by id", () async {
    mockfindById();

    var res = await contatoApi.find(id);

    expect(res.id, id);
  });

  test("list all", () async {
    mockListAll();

    var res = await contatoApi.listAll();

    expect(res[0].id, id);
  });

  test("list All by Page", () async {
    mockListAllPage(0, 5);

    var res = await contatoApi.listAllPage(0, 5);

    expect(res[0].id, id);
  });

  test('save (new)', () async {
    mockSave(body);

    var res = await contatoApi.save(body);

    expect(res, ContatoModel());
  });

  test('save (update)', () async {
    body['id'] = id;
    mockUpdate(body);

    ContatoModel res = await contatoApi.save(body);

    expect(res, bodyObject);
  });
}
