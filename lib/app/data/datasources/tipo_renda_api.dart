// import 'dart:convert';

// import 'package:syshouse/app/data/models/tipo_renda_model.dart';
// import 'package:syshouse/app/domain/entities/tipo_renda.dart';
// import 'package:syshouse/core/error/exceptions.dart';
// import 'package:syshouse/core/network/http_adapter.dart';

// abstract class TipoRendaApi {
//   Future<TipoRendaModel> findTipoRenda(String idTipoRenda);

//   Future<TipoRendaModel> listAllTipoRenda();

//   Future<TipoRendaModel> listAllTipoRendaPage(int page, int size);

//   Future<TipoRendaModel> insertTipoRenda(TipoRenda tiporenda);

//   Future<TipoRendaModel> updateTipoRenda(TipoRenda tiporenda);

//   Future<TipoRendaModel> deleteTipoRenda(String idTipoRenda);
// }

// class TipoRendaApiImpl implements TipoRendaApi {
//   static String urlBase = "https://system-house.herokuapp.com";

//   HttpAdapterImpl httpClient = HttpAdapterImpl("$urlBase/tiporenda");

//   TipoRendaModel _handleRequest(ResponseAdapter response) {
//     if (response.statusCode == 200) {
//       return TipoRendaModel.fromJson(json.decode(response.body));
//     } else {
//       throw ClientServerErrorException();
//     }
//   }

//   @override
//   Future<TipoRendaModel> deleteTipoRenda(String idTipoRenda) {
//     throw UnimplementedError();
//   }

//   @override
//   Future<TipoRendaModel> findTipoRenda(String idTipoRenda) async {
//     return _handleRequest(await httpClient.findById(idTipoRenda));
//   }

//   @override
//   Future<TipoRendaModel> insertTipoRenda(TipoRenda tiporenda) {
//     throw UnimplementedError();
//   }

//   @override
//   Future<TipoRendaModel> listAllTipoRenda() async {
//     return _handleRequest(await httpClient.findAll());
//   }

//   @override
//   Future<TipoRendaModel> listAllTipoRendaPage(int page, int size) {
//     throw UnimplementedError();
//   }

//   @override
//   Future<TipoRendaModel> updateTipoRenda(TipoRenda tiporenda) {
//     throw UnimplementedError();
//   }
// }
