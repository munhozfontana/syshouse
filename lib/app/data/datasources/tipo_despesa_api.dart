import '../models/tipo_despesa_model.dart';

abstract class TipoDespesaApi {
  Future<TipoDespesaModel> findTipoDespesa(int idTipoDespesa);

  Future<TipoDespesaModel> listAllTipoDespesa(int idTipoDespesa);

  Future<TipoDespesaModel> listAllPageTipoDespesa(int idTipoDespesa);

  Future<TipoDespesaModel> insertTipoDespesa(int idTipoDespesa);

  Future<TipoDespesaModel> updateTipoDespesa(int idTipoDespesa);

  Future<TipoDespesaModel> deleteTipoDespesa(int idTipoDespesa);
}
