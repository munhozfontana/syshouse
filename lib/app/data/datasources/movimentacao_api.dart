import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/movimentacao_model.dart';
import 'utils/datasources_api.dart';
import 'utils/datasources_api_validation.dart';

class MovimentacaoApiImpl implements DatasourcesApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  MovimentacaoApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<MovimentacaoModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return MovimentacaoModel.fromJson(json.decode(response.body));
  }

  @override
  Future save(Map<String, dynamic> body) async {
    var response = await httpAdapterImpl.save(body);

    apiValidation.validate(response);

    try {
      return MovimentacaoModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return MovimentacaoModel();
    }
  }

  @override
  Future<List<MovimentacaoModel>> listAll() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    List<dynamic> list = json.decode(response.body);
    return list.map((e) => MovimentacaoModel.fromJson(e)).toList();
  }

  @override
  Future<List> listAllPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    List<dynamic> list = json.decode(response.body);
    return list.map((e) => MovimentacaoModel.fromJson(e)).toList();
  }
}
