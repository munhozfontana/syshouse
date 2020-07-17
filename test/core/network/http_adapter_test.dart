import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:syshouse/core/network/http_adapter.dart';

class MockHttpClient extends Mock implements http.Client {}

class _BodyRequestNew {
  String id;
  String anyValue;
}

void main() {
  HttpAdapterImpl httpAdapterImpl;
  const _apiMock = "https://mockApi.com/domonio";

  setUp(() {
    httpAdapterImpl = HttpAdapterImpl(_apiMock);
    httpAdapterImpl.httpClient = MockHttpClient();
  });

  // mocks
  void mockGet200() {
    when(httpAdapterImpl.httpClient.get(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer(
      (_) async =>
          http.Response("[{'anyValue': 'anyValue', 'id': 'anyId'}]", 200),
    );
  }

  void mockPost201() {
    when(httpAdapterImpl.httpClient.post(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer(
      (_) async => http.Response('', 201),
    );
  }

  void mockPut201() {
    when(httpAdapterImpl.httpClient.put(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer(
      (_) async =>
          http.Response("{'anyValue': 'anyValue', 'id': 'anyId'}", 200),
    );
  }

  void mockDelete204() {
    when(httpAdapterImpl.httpClient.delete(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer(
      (_) async => http.Response("", 204),
    );
  }

  // tests
  group("Check if http.dart called", () {
    test("Method findAll", () async {
      mockGet200();

      httpAdapterImpl.findAll();

      verify(
        httpAdapterImpl.httpClient.get(
          _apiMock,
          headers: httpAdapterImpl.headers,
        ),
      ).called(1);
    });

    test("Method findById", () async {
      mockGet200();
      var param = "1";

      httpAdapterImpl.findById(param);

      verify(
        httpAdapterImpl.httpClient.get(
          "$_apiMock/$param",
          headers: httpAdapterImpl.headers,
        ),
      ).called(1);
    });

    test("Method findAllByPage", () async {
      mockGet200();
      var page = 1;
      var size = 1;

      httpAdapterImpl.findAllByPage(page, size);

      verify(
        httpAdapterImpl.httpClient.get(
          "$_apiMock?page=$page&size=$size",
          headers: httpAdapterImpl.headers,
        ),
      ).called(1);
    });

    test("Method save(new value)", () async {
      mockPost201();

      var body = _BodyRequestNew();
      body.anyValue = "value";

      await httpAdapterImpl.save(body);

      verify(
        httpAdapterImpl.httpClient.post(
          "$_apiMock",
          headers: httpAdapterImpl.headers,
          body: body,
        ),
      ).called(1);
    });

    test("Method save(update value)", () async {
      mockPut201();

      var body = _BodyRequestNew();
      body.id = "anyId";
      body.anyValue = "anyValue";

      await httpAdapterImpl.save(body);

      verify(
        httpAdapterImpl.httpClient.put(
          "$_apiMock/${body.id}",
          headers: httpAdapterImpl.headers,
          body: body,
        ),
      ).called(1);
    });

    test("Method save(update value)", () async {
      mockDelete204();
      var param = "32142";
      await httpAdapterImpl.delete(param);

      verify(
        httpAdapterImpl.httpClient.delete(
          "$_apiMock/$param",
          headers: httpAdapterImpl.headers,
        ),
      ).called(1);
    });
  });
}
