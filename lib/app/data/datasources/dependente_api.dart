import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/dependente.dart';
import '../models/dependente_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class DependenteApi {
  Future<DependenteModel> find(String id);

  Future<List<DependenteModel>> list();

  Future<List<DependenteModel>> listPage(int page, int size);

  Future<DependenteModel> save(Dependente body);

  Future<void> delete(String id);
}

class DependenteApiImpl implements DependenteApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  DependenteApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<DependenteModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return DependenteModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<DependenteModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => DependenteModel.fromJson(e)).toList();
  }

  @override
  Future<List<DependenteModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => DependenteModel.fromJson(e)).toList();
  }

  @override
  Future<DependenteModel> save(Dependente body) async {
    var response = await httpAdapter.save((body as DependenteModel).toJson());

    apiValidation.validate(response);

    try {
      return DependenteModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return DependenteModel();
    }
  }
}
