import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/tipo_renda_model.dart';
import 'utils/datasources_api.dart';
import 'utils/datasources_api_validation.dart';

class TipoRendaApiImpl implements DatasourcesApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  TipoRendaApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<TipoRendaModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return TipoRendaModel.fromJson(json.decode(response.body));
  }

  @override
  Future save(Object body) async {
    var response = await httpAdapterImpl.save(body);

    apiValidation.validate(response);

    try {
      return TipoRendaModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return TipoRendaModel();
    }
  }

  @override
  Future<List<TipoRendaModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    List<Object> list = json.decode(response.body);
    return list.map((e) => TipoRendaModel.fromJson(e)).toList();
  }

  @override
  Future<List> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    List<Object> list = json.decode(response.body);
    return list.map((e) => TipoRendaModel.fromJson(e)).toList();
  }
}
