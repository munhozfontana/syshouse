import '../models/socio_patrimonio_model.dart';

abstract class SocioPatrimonioApi {
  Future<SocioPatrimonioModel> findSocioPatrimonio(int idSocioPatrimonio);

  Future<SocioPatrimonioModel> listAllSocioPatrimonio(int idSocioPatrimonio);

  Future<SocioPatrimonioModel> listAllPageSocioPatrimonio(
      int idSocioPatrimonio);

  Future<SocioPatrimonioModel> insertSocioPatrimonio(int idSocioPatrimonio);

  Future<SocioPatrimonioModel> updateSocioPatrimonio(int idSocioPatrimonio);

  Future<SocioPatrimonioModel> deleteSocioPatrimonio(int idSocioPatrimonio);
}
