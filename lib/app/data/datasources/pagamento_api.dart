import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/pagamento.dart';
import '../models/pagamento_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class PagamentoApi {
  Future<PagamentoModel> find(String id);

  Future<List<PagamentoModel>> list();

  Future<List<PagamentoModel>> listPage(int page, int size);

  Future<PagamentoModel> save(Pagamento body);

  Future<void> delete(String id);
}

class PagamentoApiImpl implements PagamentoApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  PagamentoApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<PagamentoModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return PagamentoModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<PagamentoModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagamentoModel.fromJson(e)).toList();
  }

  @override
  Future<List<PagamentoModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PagamentoModel.fromJson(e)).toList();
  }

  @override
  Future<PagamentoModel> save(Pagamento body) async {
    var response = await httpAdapter.save(cast<PagamentoModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return PagamentoModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return PagamentoModel();
    }
  }
}
