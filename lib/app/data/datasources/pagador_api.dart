import '../models/pagador_model.dart';

abstract class PagadorApi {
  Future<PagadorModel> findPagador(int idPagador);

  Future<PagadorModel> listAllPagador(int idPagador);

  Future<PagadorModel> listAllPagePagador(int idPagador);

  Future<PagadorModel> insertPagador(int idPagador);

  Future<PagadorModel> updatePagador(int idPagador);

  Future<PagadorModel> deletePagador(int idPagador);
}
