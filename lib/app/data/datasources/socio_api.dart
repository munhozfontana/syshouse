import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/socio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class SocioApi {
  Future<SocioModel> find(String id);

  Future<List<SocioModel>> list();

  Future<List<SocioModel>> listPage(int page, int size);

  Future<SocioModel> save(SocioModel body);

  Future<void> delete(String id);
}

class SocioApiImpl implements SocioApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  SocioApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<SocioModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return SocioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<SocioModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => SocioModel.fromJson(e)).toList();
  }

  @override
  Future<List<SocioModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => SocioModel.fromJson(e)).toList();
  }

  @override
  Future<SocioModel> save(SocioModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return SocioModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return SocioModel();
    }
  }
}
