import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:syshouse/app/domain/entities/dependente.dart';

import '../../../core/network/http_adapter.dart';
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
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  DependenteApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<DependenteModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return DependenteModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<DependenteModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => DependenteModel.fromJson(e)).toList();
  }

  @override
  Future<List<DependenteModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => DependenteModel.fromJson(e)).toList();
  }

  @override
  Future<DependenteModel> save(Dependente body) async {
    DependenteModel dependenteModel = body;
    var response = await httpAdapterImpl.save(dependenteModel.toJson());

    apiValidation.validate(response);

    try {
      return DependenteModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return DependenteModel();
    }
  }
}
