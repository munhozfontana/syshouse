import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HttpAdapterImpl implements HttpAdapter {
  final String path;
  final http.Client client;
  String root;

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json',
  };

  HttpAdapterImpl({
    @required this.path,
    @required this.client,
  }) {
    root = DotEnv().env['URL_HEROKU'];
  }

  @override
  Future<ResponseAdapter> findById(String param) async {
    return mackObj(
      await client.get("$root/$path/$param", headers: headers),
    );
  }

  @override
  Future<ResponseAdapter> findAll() async {
    return mackObj(await client.get("$root/$path", headers: headers));
  }

  @override
  Future<ResponseAdapter> findAllByPage(int page, int size) async {
    return mackObj(await client.get("$root/$path?page=$page&size=$size",
        headers: headers));
  }

  @override
  Future<ResponseAdapter> delete(String param) async {
    return mackObj(await client.delete("$root/$path/$param", headers: headers));
  }

  @override
  Future<ResponseAdapter> save(dynamic body) async {
    if (body?.id == null) {
      return mackObj(
        await client.post(
          "$root/$path/",
          headers: headers,
          body: body,
        ),
      );
    } else {
      return mackObj(
        await client.put(
          "$root/$path/${body.id}",
          headers: headers,
          body: body,
        ),
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
  Future<ResponseAdapter> findAll();
  Future<ResponseAdapter> findAllByPage(int page, int size);
  Future<ResponseAdapter> findById(String param);
  Future<ResponseAdapter> save(dynamic body);
  Future<ResponseAdapter> delete(String param);
}
