import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/pagamento.dart';

abstract class PagamentoRepository {
  Future<Either<Failure, Pagamento>> findPagamento(String id);

  Future<Either<Failure, List<Pagamento>>> listPagamento();

  Future<Either<Failure, List<Pagamento>>> listPagePagamento(
      int page, int size);

  Future<Either<Failure, Pagamento>> savePagamento(Pagamento body);

  Future<Either<Failure, void>> deletePagamento(String id);
}
