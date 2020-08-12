import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/localizacao_model.dart';
import 'utils/datasources_api.dart';
import 'utils/datasources_api_validation.dart';

class LocalizacaoApiImpl implements DatasourcesApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  LocalizacaoApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<LocalizacaoModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return LocalizacaoModel.fromJson(json.decode(response.body));
  }

  @override
  Future save(Object body) async {
    var response = await httpAdapterImpl.save(body);

    apiValidation.validate(response);

    try {
      return LocalizacaoModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return LocalizacaoModel();
    }
  }

  @override
  Future<List<LocalizacaoModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    List<dynamic> list = json.decode(response.body);
    return list.map((e) => LocalizacaoModel.fromJson(e)).toList();
  }

  @override
  Future<List> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    List<dynamic> list = json.decode(response.body);
    return list.map((e) => LocalizacaoModel.fromJson(e)).toList();
  }
}
