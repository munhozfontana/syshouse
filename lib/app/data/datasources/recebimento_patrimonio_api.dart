import '../models/recebimento_patrimonio_model.dart';

abstract class RecebimentoPatrimonioApi {
  Future<RecebimentoPatrimonioModel> findRecebimentoPatrimonio(
      int idRecebimentoPatrimonio);

  Future<RecebimentoPatrimonioModel> listAllRecebimentoPatrimonio(
      int idRecebimentoPatrimonio);

  Future<RecebimentoPatrimonioModel> listAllPageRecebimentoPatrimonio(
      int idRecebimentoPatrimonio);

  Future<RecebimentoPatrimonioModel> insertRecebimentoPatrimonio(
      int idRecebimentoPatrimonio);

  Future<RecebimentoPatrimonioModel> updateRecebimentoPatrimonio(
      int idRecebimentoPatrimonio);

  Future<RecebimentoPatrimonioModel> deleteRecebimentoPatrimonio(
      int idRecebimentoPatrimonio);
}
