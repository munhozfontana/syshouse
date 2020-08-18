import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/localizacao_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class LocalizacaoApi {
  Future<LocalizacaoModel> find(String id);

  Future<List<LocalizacaoModel>> list();

  Future<List<LocalizacaoModel>> listPage(int page, int size);

  Future<LocalizacaoModel> save(LocalizacaoModel body);

  Future<void> delete(String id);
}

class LocalizacaoApiImpl implements LocalizacaoApi {
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
  Future<List<LocalizacaoModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => LocalizacaoModel.fromJson(e)).toList();
  }

  @override
  Future<List<LocalizacaoModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => LocalizacaoModel.fromJson(e)).toList();
  }

  @override
  Future<LocalizacaoModel> save(LocalizacaoModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return LocalizacaoModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return LocalizacaoModel();
    }
  }
}
