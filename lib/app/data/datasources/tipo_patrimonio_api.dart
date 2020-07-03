import '../models/tipo_patrimonio_model.dart';

abstract class TipoPatrimonioApi {
  Future<TipoPatrimonioModel> findTipoPatrimonio(int idTipoPatrimonio);

  Future<TipoPatrimonioModel> listAllTipoPatrimonio(int idTipoPatrimonio);

  Future<TipoPatrimonioModel> listAllPageTipoPatrimonio(int idTipoPatrimonio);

  Future<TipoPatrimonioModel> insertTipoPatrimonio(int idTipoPatrimonio);

  Future<TipoPatrimonioModel> updateTipoPatrimonio(int idTipoPatrimonio);

  Future<TipoPatrimonioModel> deleteTipoPatrimonio(int idTipoPatrimonio);
}
