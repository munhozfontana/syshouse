import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/pagamento_patrimonio.dart';

abstract class PagamentoPatrimonioRepository {
  Future<Either<Failure, PagamentoPatrimonio>> findPagamentoPatrimonio(
      String id);

  Future<Either<Failure, List<PagamentoPatrimonio>>> listPagamentoPatrimonio();

  Future<Either<Failure, List<PagamentoPatrimonio>>>
      listPagePagamentoPatrimonio(int page, int size);

  Future<Either<Failure, PagamentoPatrimonio>> savePagamentoPatrimonio(
      PagamentoPatrimonio body);

  Future<Either<Failure, void>> deletePagamentoPatrimonio(String id);
}
