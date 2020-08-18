import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/pagamento_patrimonio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class PagamentoPatrimonioApi {
  Future<PagamentoPatrimonioModel> find(String id);

  Future<List<PagamentoPatrimonioModel>> list();

  Future<List<PagamentoPatrimonioModel>> listPage(int page, int size);

  Future<PagamentoPatrimonioModel> save(PagamentoPatrimonioModel body);

  Future<void> delete(String id);
}

class PagamentoPatrimonioApiImpl implements PagamentoPatrimonioApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  PagamentoPatrimonioApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<PagamentoPatrimonioModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return PagamentoPatrimonioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<PagamentoPatrimonioModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagamentoPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<List<PagamentoPatrimonioModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagamentoPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<PagamentoPatrimonioModel> save(PagamentoPatrimonioModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return PagamentoPatrimonioModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return PagamentoPatrimonioModel();
    }
  }
}
