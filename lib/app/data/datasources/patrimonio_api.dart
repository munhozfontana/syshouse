import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/patrimonio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class PatrimonioApi {
  Future<PatrimonioModel> find(String id);

  Future<List<PatrimonioModel>> list();

  Future<List<PatrimonioModel>> listPage(int page, int size);

  Future<PatrimonioModel> save(PatrimonioModel body);

  Future<void> delete(String id);
}

class PatrimonioApiImpl implements PatrimonioApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  PatrimonioApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<PatrimonioModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return PatrimonioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<PatrimonioModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<List<PatrimonioModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<PatrimonioModel> save(PatrimonioModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return PatrimonioModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return PatrimonioModel();
    }
  }
}
