import '../models/despesa_model.dart';

abstract class DespesaApi {
  Future<DespesaModel> findDespesa(int idDespesa);

  Future<DespesaModel> listAllDespesa(int idDespesa);

  Future<DespesaModel> listAllPageDespesa(int idDespesa);

  Future<DespesaModel> insertDespesa(int idDespesa);

  Future<DespesaModel> updateDespesa(int idDespesa);

  Future<DespesaModel> deleteDespesa(int idDespesa);
}
