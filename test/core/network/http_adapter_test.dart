import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:syshouse/core/network/http_adapter.dart';

class MockClient extends Mock implements http.Client {}

void main() async {
  await DotEnv().load('.env');
  HttpAdapterImpl httpAdapterImpl;
  http.Client client;
  const path = "anyPath";
  var root;

  setUp(() {
    client = MockClient();
    httpAdapterImpl = HttpAdapterImpl(path: path, client: client);
    root = DotEnv().env['URL_HEROKU'];
  });

  // mocks
  void mockGet200() {
    when(client.get(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer(
      (_) async =>
          http.Response("[{'anyValue': 'anyValue', 'id': 'anyId'}]", 200),
    );
  }

  void mockPost201() {
    when(client.post(
      any,
      headers: {
        'Content-Type': 'application/json',
      },
      body: anyNamed('body'),
    )).thenAnswer(
      (_) async => http.Response('', 201),
    );
  }

  void mockPut201() {
    when(client.put(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer(
      (_) async =>
          http.Response("{'anyValue': 'anyValue', 'id': 'anyId'}", 200),
    );
  }

  void mockDelete204() {
    when(client.delete(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer(
      (_) async => http.Response("", 204),
    );
  }

  group("Check if http.dart called", () {
    test("Method findAll", () async {
      mockGet200();

      httpAdapterImpl.findAll();

      verify(client.get('$root/$path', headers: anyNamed("headers"))).called(1);
    });

    test("Method findById", () async {
      mockGet200();
      var param = "1";

      httpAdapterImpl.findById(param);

      verify(client.get("$root/$path/$param", headers: anyNamed("headers")))
          .called(1);
    });

    test("Method findAllByPage", () async {
      mockGet200();
      var page = 1;
      var size = 1;

      httpAdapterImpl.findAllByPage(page, size);

      verify(client.get("$root/$path?page=$page&size=$size",
              headers: anyNamed("headers")))
          .called(1);
    });

    test("Method save(new value)", () async {
      mockPost201();

      var body = {"anyKey": "anyValue"};

      await httpAdapterImpl.save(body);

      verify(client.post('$root/$path',
              headers: anyNamed("headers"), body: jsonEncode(body)))
          .called(1);
    });

    test("Method save(update value)", () async {
      mockPut201();

      var body = {"id": "anyId", "anyKey": "anyValue"};

      await httpAdapterImpl.save(body);

      verify(client.put('$root/$path/${body['id']}',
              headers: anyNamed("headers"), body: body))
          .called(1);
    });

    test("Method delete", () async {
      mockDelete204();

      var param = "32142";

      await httpAdapterImpl.delete(param);

      verify(client.delete('$root/$path/$param', headers: anyNamed("headers")))
          .called(1);
    });
  });
}
