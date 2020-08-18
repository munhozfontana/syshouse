import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/tipo_despesa_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class TipoDespesaApi {
  Future<TipoDespesaModel> find(String id);

  Future<List<TipoDespesaModel>> list();

  Future<List<TipoDespesaModel>> listPage(int page, int size);

  Future<TipoDespesaModel> save(TipoDespesaModel body);

  Future<void> delete(String id);
}

class TipoDespesaApiImpl implements TipoDespesaApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  TipoDespesaApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<TipoDespesaModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return TipoDespesaModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<TipoDespesaModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => TipoDespesaModel.fromJson(e)).toList();
  }

  @override
  Future<List<TipoDespesaModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => TipoDespesaModel.fromJson(e)).toList();
  }

  @override
  Future<TipoDespesaModel> save(TipoDespesaModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return TipoDespesaModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return TipoDespesaModel();
    }
  }
}
