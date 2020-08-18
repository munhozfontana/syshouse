import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../core/network/http_adapter.dart';
import '../models/socio_patrimonio_model.dart';
import 'utils/datasources_api_validation.dart';

abstract class SocioPatrimonioApi {
  Future<SocioPatrimonioModel> find(String id);

  Future<List<SocioPatrimonioModel>> list();

  Future<List<SocioPatrimonioModel>> listPage(int page, int size);

  Future<SocioPatrimonioModel> save(SocioPatrimonioModel body);

  Future<void> delete(String id);
}

class SocioPatrimonioApiImpl implements SocioPatrimonioApi {
  final HttpAdapter httpAdapterImpl;
  final DatasourcesApiValidation apiValidation;

  SocioPatrimonioApiImpl({
    @required this.httpAdapterImpl,
    @required this.apiValidation,
  });

  @override
  Future<void> delete(String id) async {
    var response = await httpAdapterImpl.delete(id);

    apiValidation.validate(response);
  }

  @override
  Future<SocioPatrimonioModel> find(String id) async {
    var response = await httpAdapterImpl.findById(id);

    apiValidation.validate(response);

    return SocioPatrimonioModel.fromJson(json.decode(response.body));
  }

  @override
  Future<List<SocioPatrimonioModel>> list() async {
    var response = await httpAdapterImpl.findAll();

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => SocioPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<List<SocioPatrimonioModel>> listPage(int page, int size) async {
    var response = await httpAdapterImpl.findAllByPage(page, size);

    apiValidation.validate(response);

    var list = json.decode(response.body) as List;
    return list.map((e) => SocioPatrimonioModel.fromJson(e)).toList();
  }

  @override
  Future<SocioPatrimonioModel> save(SocioPatrimonioModel body) async {
    var response = await httpAdapterImpl.save(body.toJson());

    apiValidation.validate(response);

    try {
      return SocioPatrimonioModel.fromJson(json.decode(response.body));
    } on FormatException catch (e) {
      print(e.message);
      return SocioPatrimonioModel();
    }
  }
}
