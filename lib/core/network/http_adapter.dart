import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HttpAdapterImpl implements HttpAdapter {
  final String url;
  final http.Client client;

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json',
  };

  HttpAdapterImpl({
    @required this.url,
    @required this.client,
  });

  @override
  Future<ResponseAdapter> findById(String param) async {
    return mackObj(await client.get("$url/$param", headers: headers));
  }

  @override
  Future<ResponseAdapter> findAll() async {
    return mackObj(await client.get("$url", headers: headers));
  }

  @override
  Future<ResponseAdapter> findAllByPage(int page, int size) async {
    return mackObj(
        await client.get("$url?page=$page&size=$size", headers: headers));
  }

  @override
  Future<ResponseAdapter> delete(String param) async {
    return mackObj(await client.delete("$url/$param", headers: headers));
  }

  @override
  Future<ResponseAdapter> save(Map<String, dynamic> body) async {
    if (body['id'] == null) {
      return mackObj(
        await client.post(
          "$url",
          headers: headers,
          body: jsonEncode(body),
        ),
      );
    } else {
      return mackObj(
        await client.put(
          "$url/${body['id']}",
          headers: headers,
          body: jsonEncode(body),
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
  Future<dynamic> findAll();
  Future<dynamic> findAllByPage(int page, int size);
  Future<dynamic> findById(String param);
  Future<dynamic> save(Map<String, dynamic> body);
  Future<dynamic> delete(String param);
}
