import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/midia_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class MidiaApi {
  Future<MidiaModel> find(String id);

  Future<List<MidiaModel>> list();

  Future<List<MidiaModel>> listPage(int page, int size);

  Future<MidiaModel> save(MidiaModel body);

  Future<void> delete(String id);
}

class MidiaApiImpl implements MidiaApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  MidiaApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<MidiaModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return MidiaModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<MidiaModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => MidiaModel.fromJson(e)).toList();
  }

  @override
  Future<List<MidiaModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => MidiaModel.fromJson(e)).toList();
  }

  @override
  Future<MidiaModel> save(MidiaModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return MidiaModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return MidiaModel();
    }
  }
}
