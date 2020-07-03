import '../models/tipo_renda_model.dart';

abstract class TipoRendaApi {
  Future<TipoRendaModel> findTipoRenda(int idTipoRenda);

  Future<TipoRendaModel> listAllTipoRenda(int idTipoRenda);

  Future<TipoRendaModel> listAllPageTipoRenda(int idTipoRenda);

  Future<TipoRendaModel> insertTipoRenda(int idTipoRenda);

  Future<TipoRendaModel> updateTipoRenda(int idTipoRenda);

  Future<TipoRendaModel> deleteTipoRenda(int idTipoRenda);
}
