import '../models/renda_model.dart';

abstract class RendaApi {
  Future<RendaModel> findRenda(int idRenda);

  Future<RendaModel> listAllRenda(int idRenda);

  Future<RendaModel> listAllPageRenda(int idRenda);

  Future<RendaModel> insertRenda(int idRenda);

  Future<RendaModel> updateRenda(int idRenda);

  Future<RendaModel> deleteRenda(int idRenda);
}
