import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/localizacao.dart';
import '../models/localizacao_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class LocalizacaoApi {
  Future<LocalizacaoModel> find(String id);

  Future<List<LocalizacaoModel>> list();

  Future<List<LocalizacaoModel>> listPage(int page, int size);

  Future<LocalizacaoModel> save(Localizacao body);

  Future<void> delete(String id);
}

class LocalizacaoApiImpl implements LocalizacaoApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  LocalizacaoApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<LocalizacaoModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return LocalizacaoModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<LocalizacaoModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => LocalizacaoModel.fromJson(e)).toList();
  }

  @override
  Future<List<LocalizacaoModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => LocalizacaoModel.fromJson(e)).toList();
  }

  @override
  Future<LocalizacaoModel> save(Localizacao body) async {
    var response =
        await httpAdapter.save(cast<LocalizacaoModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return LocalizacaoModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return LocalizacaoModel();
    }
  }
}
