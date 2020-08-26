import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/patrimonio.dart';
import '../models/patrimonio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class PatrimonioApi {
  Future<PatrimonioModel> find(String id);

  Future<List<PatrimonioModel>> list();

  Future<List<PatrimonioModel>> listPage(int page, int size);

  Future<PatrimonioModel> save(Patrimonio body);

  Future<void> delete(String id);
}

class PatrimonioApiImpl implements PatrimonioApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  PatrimonioApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<PatrimonioModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return PatrimonioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<PatrimonioModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<List<PatrimonioModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => PatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<PatrimonioModel> save(Patrimonio body) async {
    var response = await httpAdapter.save(body);

    apiValidation.validate(response);

    try {
      return PatrimonioModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return PatrimonioModel();
    }
  }
}
