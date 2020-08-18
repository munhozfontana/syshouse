import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/recebimento_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class RecebimentoApi {
  Future<RecebimentoModel> find(String id);

  Future<List<RecebimentoModel>> list();

  Future<List<RecebimentoModel>> listPage(int page, int size);

  Future<RecebimentoModel> save(RecebimentoModel body);

  Future<void> delete(String id);
}

class RecebimentoApiImpl implements RecebimentoApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  RecebimentoApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<RecebimentoModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return RecebimentoModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<RecebimentoModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => RecebimentoModel.fromJson(e)).toList();
  }

  @override
  Future<List<RecebimentoModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => RecebimentoModel.fromJson(e)).toList();
  }

  @override
  Future<RecebimentoModel> save(RecebimentoModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return RecebimentoModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return RecebimentoModel();
    }
  }
}
