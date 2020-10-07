import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/tipo_patrimonio.dart';
import '../models/tipo_patrimonio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class TipoPatrimonioApi {
  Future<TipoPatrimonioModel> find(String id);

  Future<List<TipoPatrimonioModel>> list();

  Future<List<TipoPatrimonioModel>> listPage(int page, int size);

  Future<TipoPatrimonioModel> save(TipoPatrimonio body);

  Future<void> delete(String id);
}

class TipoPatrimonioApiImpl implements TipoPatrimonioApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  TipoPatrimonioApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<TipoPatrimonioModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return TipoPatrimonioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<TipoPatrimonioModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => TipoPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<List<TipoPatrimonioModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => TipoPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<TipoPatrimonioModel> save(TipoPatrimonio body) async {
    var response =
        await httpAdapter.save(cast<TipoPatrimonioModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return TipoPatrimonioModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return TipoPatrimonioModel();
    }
  }
}
