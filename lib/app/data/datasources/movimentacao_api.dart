import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/movimentacao.dart';
import '../models/movimentacao_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class MovimentacaoApi {
  Future<MovimentacaoModel> find(String id);

  Future<List<MovimentacaoModel>> list();

  Future<List<MovimentacaoModel>> listPage(int page, int size);

  Future<MovimentacaoModel> save(Movimentacao body);

  Future<void> delete(String id);
}

class MovimentacaoApiImpl implements MovimentacaoApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  MovimentacaoApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<MovimentacaoModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return MovimentacaoModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<MovimentacaoModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => MovimentacaoModel.fromJson(e)).toList();
  }

  @override
  Future<List<MovimentacaoModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => MovimentacaoModel.fromJson(e)).toList();
  }

  @override
  Future<MovimentacaoModel> save(Movimentacao body) async {
    var response = await httpAdapter.save(body);

    apiValidation.validate(response);

    try {
      return MovimentacaoModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return MovimentacaoModel();
    }
  }
}
