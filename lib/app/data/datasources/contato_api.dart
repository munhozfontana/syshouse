import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/contato.dart';
import '../models/contato_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class ContatoApi {
  Future<ContatoModel> find(String id);

  Future<List<ContatoModel>> list();

  Future<List<ContatoModel>> listPage(int page, int size);

  Future<ContatoModel> save(Contato body);

  Future<void> delete(String id);
}

class ContatoApiImpl implements ContatoApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  ContatoApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<ContatoModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return ContatoModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<ContatoModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => ContatoModel.fromJson(e)).toList();
  }

  @override
  Future<List<ContatoModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => ContatoModel.fromJson(e)).toList();
  }

  @override
  Future<ContatoModel> save(Contato body) async {
    var response = await httpAdapter.save((body as ContatoModel).toJson());

    apiValidation.validate(response);

    try {
      return ContatoModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return ContatoModel();
    }
  }
}
