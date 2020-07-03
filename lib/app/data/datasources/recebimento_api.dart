import '../models/recebimento_model.dart';

abstract class RecebimentoApi {
  Future<RecebimentoModel> findRecebimento(int idRecebimento);

  Future<RecebimentoModel> listAllRecebimento(int idRecebimento);

  Future<RecebimentoModel> listAllPageRecebimento(int idRecebimento);

  Future<RecebimentoModel> insertRecebimento(int idRecebimento);

  Future<RecebimentoModel> updateRecebimento(int idRecebimento);

  Future<RecebimentoModel> deleteRecebimento(int idRecebimento);
}
