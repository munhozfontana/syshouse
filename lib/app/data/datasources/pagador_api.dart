import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/pagador_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class PagadorApi {
  Future<PagadorModel> find(String id);

  Future<List<PagadorModel>> list();

  Future<List<PagadorModel>> listPage(int page, int size);

  Future<PagadorModel> save(PagadorModel body);

  Future<void> delete(String id);
}

class PagadorApiImpl implements PagadorApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  PagadorApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<PagadorModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return PagadorModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<PagadorModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagadorModel.fromJson(e)).toList();
  }

  @override
  Future<List<PagadorModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagadorModel.fromJson(e)).toList();
  }

  @override
  Future<PagadorModel> save(PagadorModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return PagadorModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return PagadorModel();
    }
  }
}
