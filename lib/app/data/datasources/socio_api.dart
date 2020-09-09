import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../../domain/entities/socio.dart';
import '../models/socio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class SocioApi {
  Future<SocioModel> find(String id);

  Future<List<SocioModel>> list();

  Future<List<SocioModel>> listPage(int page, int size);

  Future<SocioModel> save(Socio body);

  Future<void> delete(String id);
}

class SocioApiImpl implements SocioApi {
  final HttpAdapter httpAdapter;
  final DatasourcesApiValidation apiValidation;

  SocioApiImpl({
    @required this.httpAdapter,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapter.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<SocioModel> find(String id) async {
    var response = await httpAdapter.findById(id);

    apiValidation.validate(response);

    return SocioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<SocioModel>> list() async {
    var response = await httpAdapter.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => SocioModel.fromJson(e)).toList();
  }

  @override
  Future<List<SocioModel>> listPage(int page, int size) async {
    var response = await httpAdapter.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => SocioModel.fromJson(e)).toList();
  }

  @override
  Future<SocioModel> save(Socio body) async {
    var response = await httpAdapter.save(cast<SocioModel>(body).toJson());

    apiValidation.validate(response);

    try {
      return SocioModel.fromJson(json.decode(response.body));
    } on FormatException catch (_) {
      return SocioModel();
    }
  }
}
