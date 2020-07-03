import '../models/movimentacao_model.dart';

abstract class MovimentacaoApi {
  Future<MovimentacaoModel> findMovimentacao(int idMovimentacao);

  Future<MovimentacaoModel> listAllMovimentacao(int idMovimentacao);

  Future<MovimentacaoModel> listAllPageMovimentacao(int idMovimentacao);

  Future<MovimentacaoModel> insertMovimentacao(int idMovimentacao);

  Future<MovimentacaoModel> updateMovimentacao(int idMovimentacao);

  Future<MovimentacaoModel> deleteMovimentacao(int idMovimentacao);
}
