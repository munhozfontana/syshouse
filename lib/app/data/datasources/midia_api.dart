import '../models/midia_model.dart';

abstract class MidiaApi {
  Future<MidiaModel> findMidia(int idMidia);

  Future<MidiaModel> listAllMidia(int idMidia);

  Future<MidiaModel> listAllPageMidia(int idMidia);

  Future<MidiaModel> insertMidia(int idMidia);

  Future<MidiaModel> updateMidia(int idMidia);

  Future<MidiaModel> deleteMidia(int idMidia);
}
