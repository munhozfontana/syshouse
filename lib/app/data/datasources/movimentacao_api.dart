import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/movimentacao_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class MovimentacaoApi {
  Future<MovimentacaoModel> find(String id);

  Future<List<MovimentacaoModel>> list();

  Future<List<MovimentacaoModel>> listPage(int page, int size);

  Future<MovimentacaoModel> save(MovimentacaoModel body);

  Future<void> delete(String id);
}

class MovimentacaoApiImpl implements MovimentacaoApi {
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
  Future<List<MovimentacaoModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => MovimentacaoModel.fromJson(e)).toList();
  }

  @override
  Future<List<MovimentacaoModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => MovimentacaoModel.fromJson(e)).toList();
  }

  @override
  Future<MovimentacaoModel> save(MovimentacaoModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return MovimentacaoModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return MovimentacaoModel();
    }
  }
}
