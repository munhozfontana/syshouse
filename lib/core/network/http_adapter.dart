import 'dart:convert';

import 'package:flutter/material.dart';
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
    return mackObj(await client.get("$root/$path/page?page=$page&size=$size",
        headers: headers));
  }

  @override
  Future<ResponseAdapter> delete(String param) async {
    return mackObj(await client.delete("$root/$path/$param", headers: headers));
  }

  @override
  Future<ResponseAdapter> save(Map<String, dynamic> body) async {
    if (body.containsKey("id")) {
      if (body["id"] == null) {
        var res = await client.post(
          "$root/$path",
          headers: headers,
          body: jsonEncode(body),
        );
        return mackObj(res);
      } else {
        return mackObj(
          await client.put(
            "$root/$path/${body["id"]}",
            headers: headers,
            body: body,
          ),
        );
      }
    } else {
      var res = await client.post(
        "$root/$path",
        headers: headers,
        body: jsonEncode(body),
      );
      return mackObj(res);
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
  Future<ResponseAdapter> save(Map<String, Object> body);
  Future<ResponseAdapter> delete(String param);
}
