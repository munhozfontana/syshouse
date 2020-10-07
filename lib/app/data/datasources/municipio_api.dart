import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/municipio.dart';
import '../models/municipio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class MunicipioApi {
  Future<MunicipioModel> find(String id);

  Future<List<MunicipioModel>> list();

  Future<List<MunicipioModel>> listPage(int page, int size);

  Future<MunicipioModel> save(Municipio body);

  Future<void> delete(String id);
}

class MunicipioApiImpl implements MunicipioApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  MunicipioApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<MunicipioModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return MunicipioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<MunicipioModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => MunicipioModel.fromJson(e)).toList();
  }

  @override
  Future<List<MunicipioModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => MunicipioModel.fromJson(e)).toList();
  }

  @override
  Future<MunicipioModel> save(Municipio body) async {
    var response = await httpAdapter.save(cast<MunicipioModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return MunicipioModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return MunicipioModel();
    }
  }
}
