import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/recebimento_patrimonio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class RecebimentoPatrimonioApi {
  Future<RecebimentoPatrimonioModel> find(String id);

  Future<List<RecebimentoPatrimonioModel>> list();

  Future<List<RecebimentoPatrimonioModel>> listPage(int page, int size);

  Future<RecebimentoPatrimonioModel> save(RecebimentoPatrimonioModel body);

  Future<void> delete(String id);
}

class RecebimentoPatrimonioApiImpl implements RecebimentoPatrimonioApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  RecebimentoPatrimonioApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<RecebimentoPatrimonioModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return RecebimentoPatrimonioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<RecebimentoPatrimonioModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => RecebimentoPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<List<RecebimentoPatrimonioModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => RecebimentoPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<RecebimentoPatrimonioModel> save(
      RecebimentoPatrimonioModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return RecebimentoPatrimonioModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return RecebimentoPatrimonioModel();
    }
  }
}
