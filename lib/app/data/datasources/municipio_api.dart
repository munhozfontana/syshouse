import '../models/municipio_model.dart';

abstract class MunicipioApi {
  Future<MunicipioModel> findMunicipio(int idMunicipio);

  Future<MunicipioModel> listAllMunicipio(int idMunicipio);

  Future<MunicipioModel> listAllPageMunicipio(int idMunicipio);

  Future<MunicipioModel> insertMunicipio(int idMunicipio);

  Future<MunicipioModel> updateMunicipio(int idMunicipio);

  Future<MunicipioModel> deleteMunicipio(int idMunicipio);
}
