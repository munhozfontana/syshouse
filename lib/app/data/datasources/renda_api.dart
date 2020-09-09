import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/renda.dart';
import '../models/renda_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class RendaApi {
  Future<RendaModel> find(String id);

  Future<List<RendaModel>> list();

  Future<List<RendaModel>> listPage(int page, int size);

  Future<RendaModel> save(Renda body);

  Future<void> delete(String id);
}

class RendaApiImpl implements RendaApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  RendaApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<RendaModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return RendaModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<RendaModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => RendaModel.fromJson(e)).toList();
  }

  @override
  Future<List<RendaModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => RendaModel.fromJson(e)).toList();
  }

  @override
  Future<RendaModel> save(Renda body) async {
    var response = await httpAdapter.save(cast<RendaModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return RendaModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return RendaModel();
    }
  }
}
