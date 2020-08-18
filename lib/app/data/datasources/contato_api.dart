import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/contato_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class ContatoApi {
  Future<ContatoModel> find(String id);

  Future<List<ContatoModel>> list();

  Future<List<ContatoModel>> listPage(int page, int size);

  Future<ContatoModel> save(ContatoModel body);

  Future<void> delete(String id);
}

class ContatoApiImpl implements ContatoApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  ContatoApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<ContatoModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return ContatoModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<ContatoModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => ContatoModel.fromJson(e)).toList();
  }

  @override
  Future<List<ContatoModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => ContatoModel.fromJson(e)).toList();
  }

  @override
  Future<ContatoModel> save(ContatoModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return ContatoModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return ContatoModel();
    }
  }
}
