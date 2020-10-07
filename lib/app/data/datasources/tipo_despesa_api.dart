import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/tipo_despesa.dart';
import '../models/tipo_despesa_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class TipoDespesaApi {
  Future<TipoDespesaModel> find(String id);

  Future<List<TipoDespesaModel>> list();

  Future<List<TipoDespesaModel>> listPage(int page, int size);

  Future<TipoDespesaModel> save(TipoDespesa body);

  Future<void> delete(String id);
}

class TipoDespesaApiImpl implements TipoDespesaApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  TipoDespesaApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<TipoDespesaModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return TipoDespesaModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<TipoDespesaModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => TipoDespesaModel.fromJson(e)).toList();
  }

  @override
  Future<List<TipoDespesaModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => TipoDespesaModel.fromJson(e)).toList();
  }

  @override
  Future<TipoDespesaModel> save(TipoDespesa body) async {
    var response =
        await httpAdapter.save(cast<TipoDespesaModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return TipoDespesaModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return TipoDespesaModel();
    }
  }
}
