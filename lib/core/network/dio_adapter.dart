import 'package:dio/dio.dart';
import 'package:syshouse/core/network/http_adapter.dart';

class DioAdapter implements HttpAdapter {
  final String url;

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json',
  };

  DioAdapter({this.url});

  @override
  Future<ResponseAdapter> delete(String param) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseAdapter> findAll() async {
    return mackObj(await Dio().get(url));
  }

  @override
  Future<ResponseAdapter> findAllByPage(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseAdapter> findById(String param) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseAdapter> save(body) {
    throw UnimplementedError();
  }

  ResponseAdapter mackObj(Response response) {
    return ResponseAdapter(
      statusCode: response.statusCode,
      body: response.data,
      header: response.headers.map,
    );
  }
}
