import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/tipo_renda_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class TipoRendaApi {
  Future<TipoRendaModel> find(String id);

  Future<List<TipoRendaModel>> list();

  Future<List<TipoRendaModel>> listPage(int page, int size);

  Future<TipoRendaModel> save(TipoRendaModel body);

  Future<void> delete(String id);
}

class TipoRendaApiImpl implements TipoRendaApi {
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
  Future<List<TipoRendaModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => TipoRendaModel.fromJson(e)).toList();
  }

  @override
  Future<List<TipoRendaModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => TipoRendaModel.fromJson(e)).toList();
  }

  @override
  Future<TipoRendaModel> save(TipoRendaModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return TipoRendaModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return TipoRendaModel();
    }
  }
}
