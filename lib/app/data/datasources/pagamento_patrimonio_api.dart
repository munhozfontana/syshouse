import '../models/pagamento_patrimonio_model.dart';

abstract class PagamentoPatrimonioApi {
  Future<PagamentoPatrimonioModel> findPagamentoPatrimonio(
      int idPagamentoPatrimonio);

  Future<PagamentoPatrimonioModel> listAllPagamentoPatrimonio(
      int idPagamentoPatrimonio);

  Future<PagamentoPatrimonioModel> listAllPagePagamentoPatrimonio(
      int idPagamentoPatrimonio);

  Future<PagamentoPatrimonioModel> insertPagamentoPatrimonio(
      int idPagamentoPatrimonio);

  Future<PagamentoPatrimonioModel> updatePagamentoPatrimonio(
      int idPagamentoPatrimonio);

  Future<PagamentoPatrimonioModel> deletePagamentoPatrimonio(
      int idPagamentoPatrimonio);
}
