import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/pagamento.dart';

abstract class PagamentoRepository {
  Future<Either<Failure, Pagamento>> findPagamento(String id);

  Future<Either<Failure, Pagamento>> listPagamento();

  Future<Either<Failure, Pagamento>> listPagePagamento(int page, int size);

  Future<Either<Failure, Pagamento>> savePagamento(Map<String, dynamic> body);

  Future<Either<Failure, Pagamento>> deletePagamento(String id);
}
