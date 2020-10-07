import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/pagamento_patrimonio.dart';
import '../models/pagamento_patrimonio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class PagamentoPatrimonioApi {
  Future<PagamentoPatrimonioModel> find(String id);

  Future<List<PagamentoPatrimonioModel>> list();

  Future<List<PagamentoPatrimonioModel>> listPage(int page, int size);

  Future<PagamentoPatrimonioModel> save(PagamentoPatrimonio body);

  Future<void> delete(String id);
}

class PagamentoPatrimonioApiImpl implements PagamentoPatrimonioApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  PagamentoPatrimonioApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<PagamentoPatrimonioModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return PagamentoPatrimonioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<PagamentoPatrimonioModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagamentoPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<List<PagamentoPatrimonioModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagamentoPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<PagamentoPatrimonioModel> save(PagamentoPatrimonio body) async {
    var response =
        await httpAdapter.save(cast<PagamentoPatrimonioModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return PagamentoPatrimonioModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return PagamentoPatrimonioModel();
    }
  }
}
