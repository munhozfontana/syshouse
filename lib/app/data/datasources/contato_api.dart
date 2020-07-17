import 'package:syshouse/app/domain/entities/contato.dart';

import '../models/contato_model.dart';

abstract class ContatoApi {
  Future<ContatoModel> findContato(String idContato);

  Future<ContatoModel> listAllContato();

  Future<ContatoModel> listAllContatoPage(int page, int size);

  Future<ContatoModel> insertContato(Contato contato);

  Future<ContatoModel> updateContato(Contato contato);

  Future<ContatoModel> deleteContato(String idContato);
}

// class ContatoApiImpl implements ContatoApi {
//   static String urlBase = "base";

//   HttpAdapterImpl httpClient = HttpAdapterImpl("$urlBase/");

//   @override
//   Future<ContatoModel> deleteContato(String idContato) async {
//     return _handleRequest(await httpClient.delete(idContato));
//   }

//   @override
//   Future<ContatoModel> findContato(String idContato) async {
//     return _handleRequest(await httpClient.findAll(idContato));
//   }

//   @override
//   Future<ContatoModel> insertContato(Contato contato) async {
//     return _handleRequest(await httpClient.save(contato));
//   }

//   @override
//   Future<ContatoModel> listAllContato() async {
//     return _handleRequest(await httpClient.findAll(null));
//   }

//   @override
//   Future<ContatoModel> listAllContatoPage(int page, int size) async {
//     return _handleRequest(await httpClient.delete(idContato));
//   }

//   @override
//   Future<ContatoModel> updateContato(Contato contato) async {
//     return _handleRequest(await httpClient.delete(idContato));
//   }

//   ContatoModel _handleRequest(ResponseAdapter response) {
//     if (response.statusCode == 200) {
//       return ContatoModel.fromJson(json.decode(response.body));
//     } else {
//       throw ServerApiException();
//     }
//   }
// }
