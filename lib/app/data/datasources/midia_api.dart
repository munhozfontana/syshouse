import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/midia.dart';
import '../models/midia_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class MidiaApi {
  Future<MidiaModel> find(String id);

  Future<List<MidiaModel>> list();

  Future<List<MidiaModel>> listPage(int page, int size);

  Future<MidiaModel> save(Midia body);

  Future<void> delete(String id);
}

class MidiaApiImpl implements MidiaApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  MidiaApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<MidiaModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return MidiaModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<MidiaModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => MidiaModel.fromJson(e)).toList();
  }

  @override
  Future<List<MidiaModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => MidiaModel.fromJson(e)).toList();
  }

  @override
  Future<MidiaModel> save(Midia body) async {
    var response = await httpAdapter.save(cast<MidiaModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return MidiaModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return MidiaModel();
    }
  }
}
