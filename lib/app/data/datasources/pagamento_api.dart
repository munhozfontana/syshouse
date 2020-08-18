import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/pagamento_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class PagamentoApi {
  Future<PagamentoModel> find(String id);

  Future<List<PagamentoModel>> list();

  Future<List<PagamentoModel>> listPage(int page, int size);

  Future<PagamentoModel> save(PagamentoModel body);

  Future<void> delete(String id);
}

class PagamentoApiImpl implements PagamentoApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  PagamentoApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<PagamentoModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return PagamentoModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<PagamentoModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagamentoModel.fromJson(e)).toList();
  }

  @override
  Future<List<PagamentoModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagamentoModel.fromJson(e)).toList();
  }

  @override
  Future<PagamentoModel> save(PagamentoModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return PagamentoModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return PagamentoModel();
    }
  }
}
