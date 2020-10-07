import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/pagador.dart';
import '../models/pagador_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class PagadorApi {
  Future<PagadorModel> find(String id);

  Future<List<PagadorModel>> list();

  Future<List<PagadorModel>> listPage(int page, int size);

  Future<PagadorModel> save(Pagador body);

  Future<void> delete(String id);
}

class PagadorApiImpl implements PagadorApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  PagadorApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<PagadorModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return PagadorModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<PagadorModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagadorModel.fromJson(e)).toList();
  }

  @override
  Future<List<PagadorModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagadorModel.fromJson(e)).toList();
  }

  @override
  Future<PagadorModel> save(Pagador body) async {
    var response = await httpAdapter.save(cast<PagadorModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return PagadorModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return PagadorModel();
    }
  }
}
