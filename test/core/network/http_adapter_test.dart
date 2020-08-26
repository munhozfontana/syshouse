import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:syshouse/core/network/http_adapter.dart';

class MockClient extends Mock implements http.Client {}

class AnyClassWithId {
  final String id;

  AnyClassWithId({this.id});
}

void main() {
  HttpAdapterImpl httpAdapterImpl;
  http.Client client;
  const _apiMock = "https://mockApi.com/domonio";

  setUp(() {
    client = MockClient();
    httpAdapterImpl = HttpAdapterImpl(url: _apiMock, client: client);
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

      verify(client.get(_apiMock, headers: anyNamed("headers"))).called(1);
    });

    test("Method findById", () async {
      mockGet200();
      var param = "1";

      httpAdapterImpl.findById(param);

      verify(client.get("$_apiMock/$param", headers: anyNamed("headers")))
          .called(1);
    });

    test("Method findAllByPage", () async {
      mockGet200();
      var page = 1;
      var size = 1;

      httpAdapterImpl.findAllByPage(page, size);

      verify(client.get("$_apiMock?page=$page&size=$size",
              headers: anyNamed("headers")))
          .called(1);
    });

    test("Method save(new value)", () async {
      mockPost201();

      var body = AnyClassWithId();

      await httpAdapterImpl.save(body);

      verify(client.post(_apiMock, headers: anyNamed("headers"), body: body))
          .called(1);
    });

    test("Method save(update value)", () async {
      mockPut201();

      var body = AnyClassWithId(id: "anyId");

      await httpAdapterImpl.save(body);

      verify(client.put('$_apiMock/${body.id}',
              headers: anyNamed("headers"), body: body))
          .called(1);
    });

    test("Method delete", () async {
      mockDelete204();

      var param = "32142";

      await httpAdapterImpl.delete(param);

      verify(client.delete('$_apiMock/$param', headers: anyNamed("headers")))
          .called(1);
    });
  });
}
