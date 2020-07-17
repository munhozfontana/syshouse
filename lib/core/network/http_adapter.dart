import 'package:http/http.dart' as http;

class HttpAdapterImpl extends HttpAdapter {
  final String _url;
  http.Client httpClient = http.Client();
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  HttpAdapterImpl(this._url);

  @override
  Future findById(String param) async {
    return mackObj(await httpClient.get("$_url/$param", headers: headers));
  }

  @override
  Future<ResponseAdapter> findAll() async {
    return mackObj(await httpClient.get("$_url", headers: headers));
  }

  @override
  Future findAllByPage(int page, int size) async {
    return mackObj(
        await httpClient.get("$_url?page=$page&size=$size", headers: headers));
  }

  @override
  Future<ResponseAdapter> delete(String param) async {
    return mackObj(await httpClient.delete("$_url/$param", headers: headers));
  }

  @override
  Future<ResponseAdapter> save(dynamic body) async {
    if (body?.id == null) {
      return mackObj(
        await httpClient.post("$_url", headers: headers, body: body),
      );
    } else {
      return mackObj(
        await httpClient.put("$_url/${body.id}", headers: headers, body: body),
      );
    }
  }

  ResponseAdapter mackObj(http.Response response) {
    return ResponseAdapter(
      statusCode: response.statusCode,
      body: response.body,
      header: response.headers,
    );
  }
}

class ResponseAdapter {
  int statusCode;
  String body;
  Map header;
  ResponseAdapter({
    this.statusCode,
    this.body,
    this.header,
  });
}

abstract class HttpAdapter {
  Future<dynamic> findAll();
  Future<dynamic> findAllByPage(int page, int size);
  Future<dynamic> findById(String param);
  Future<dynamic> save(dynamic body);
  Future<dynamic> delete(String param);
}
