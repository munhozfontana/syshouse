import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/tipo_renda.dart';
import '../models/tipo_renda_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class TipoRendaApi {
  Future<TipoRendaModel> find(String id);

  Future<List<TipoRendaModel>> list();

  Future<List<TipoRendaModel>> listPage(int page, int size);

  Future<TipoRendaModel> save(TipoRenda body);

  Future<void> delete(String id);
}

class TipoRendaApiImpl implements TipoRendaApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  TipoRendaApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<TipoRendaModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return TipoRendaModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<TipoRendaModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => TipoRendaModel.fromJson(e)).toList();
  }

  @override
  Future<List<TipoRendaModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => TipoRendaModel.fromJson(e)).toList();
  }

  @override
  Future<TipoRendaModel> save(TipoRenda body) async {
    var response = await httpAdapter.save(cast<TipoRendaModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return TipoRendaModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return TipoRendaModel();
    }
  }
}
