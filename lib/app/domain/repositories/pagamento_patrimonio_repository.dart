import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/pagamento_patrimonio.dart';

abstract class PagamentoPatrimonioRepository {
  Future<Either<Failure, PagamentoPatrimonio>> findPagamentoPatrimonio(
      String id);

  Future<Either<Failure, PagamentoPatrimonio>> listPagamentoPatrimonio();

  Future<Either<Failure, PagamentoPatrimonio>> listPagePagamentoPatrimonio(
      int page, int size);

  Future<Either<Failure, PagamentoPatrimonio>> savePagamentoPatrimonio(
      Map<String, dynamic> body);

  Future<Either<Failure, PagamentoPatrimonio>> deletePagamentoPatrimonio(
      String id);
}
