import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/recebimento_patrimonio.dart';
import '../models/recebimento_patrimonio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class RecebimentoPatrimonioApi {
  Future<RecebimentoPatrimonioModel> find(String id);

  Future<List<RecebimentoPatrimonioModel>> list();

  Future<List<RecebimentoPatrimonioModel>> listPage(int page, int size);

  Future<RecebimentoPatrimonioModel> save(RecebimentoPatrimonio body);

  Future<void> delete(String id);
}

class RecebimentoPatrimonioApiImpl implements RecebimentoPatrimonioApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  RecebimentoPatrimonioApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<RecebimentoPatrimonioModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return RecebimentoPatrimonioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<RecebimentoPatrimonioModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => RecebimentoPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<List<RecebimentoPatrimonioModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => RecebimentoPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<RecebimentoPatrimonioModel> save(RecebimentoPatrimonio body) async {
    var response =
        await httpAdapter.save(cast<RecebimentoPatrimonioModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return RecebimentoPatrimonioModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return RecebimentoPatrimonioModel();
    }
  }
}
