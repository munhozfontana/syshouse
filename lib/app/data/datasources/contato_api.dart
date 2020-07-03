import '../models/contato_model.dart';

abstract class ContatoApi {
  Future<ContatoModel> findContato(int idContato);

  Future<ContatoModel> listAllContato(int idContato);

  Future<ContatoModel> listAllPageContato(int idContato);

  Future<ContatoModel> insertContato(int idContato);

  Future<ContatoModel> updateContato(int idContato);

  Future<ContatoModel> deleteContato(int idContato);
}
