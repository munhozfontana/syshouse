import '../models/socio_model.dart';

abstract class SocioApi {
  Future<SocioModel> findSocio(int idSocio);

  Future<SocioModel> listAllSocio(int idSocio);

  Future<SocioModel> listAllPageSocio(int idSocio);

  Future<SocioModel> insertSocio(int idSocio);

  Future<SocioModel> updateSocio(int idSocio);

  Future<SocioModel> deleteSocio(int idSocio);
}
