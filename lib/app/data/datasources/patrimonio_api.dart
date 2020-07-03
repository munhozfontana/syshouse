import '../models/patrimonio_model.dart';

abstract class PatrimonioApi {
  Future<PatrimonioModel> findPatrimonio(int idPatrimonio);

  Future<PatrimonioModel> listAllPatrimonio(int idPatrimonio);

  Future<PatrimonioModel> listAllPagePatrimonio(int idPatrimonio);

  Future<PatrimonioModel> insertPatrimonio(int idPatrimonio);

  Future<PatrimonioModel> updatePatrimonio(int idPatrimonio);

  Future<PatrimonioModel> deletePatrimonio(int idPatrimonio);
}
