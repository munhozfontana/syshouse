import '../models/pagamento_model.dart';

abstract class PagamentoApi {
  Future<PagamentoModel> findPagamento(int idPagamento);

  Future<PagamentoModel> listAllPagamento(int idPagamento);

  Future<PagamentoModel> listAllPagePagamento(int idPagamento);

  Future<PagamentoModel> insertPagamento(int idPagamento);

  Future<PagamentoModel> updatePagamento(int idPagamento);

  Future<PagamentoModel> deletePagamento(int idPagamento);
}
