import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/despesa.dart';
import '../models/despesa_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class DespesaApi {
  Future<DespesaModel> find(String id);

  Future<List<DespesaModel>> list();

  Future<List<DespesaModel>> listPage(int page, int size);

  Future<DespesaModel> save(Despesa body);

  Future<void> delete(String id);
}

class DespesaApiImpl implements DespesaApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  DespesaApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<DespesaModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return DespesaModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<DespesaModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => DespesaModel.fromJson(e)).toList();
  }

  @override
  Future<List<DespesaModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => DespesaModel.fromJson(e)).toList();
  }

  @override
  Future<DespesaModel> save(Despesa body) async {
    var response = await httpAdapter.save(cast<DespesaModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return DespesaModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return DespesaModel();
    }
  }
}
