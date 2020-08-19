import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movimentacao.dart';

abstract class MovimentacaoRepository {
  Future<Either<Failure, Movimentacao>> findMovimentacao(String id);

  Future<Either<Failure, List<Movimentacao>>> listMovimentacao();

  Future<Either<Failure, List<Movimentacao>>> listPageMovimentacao(
      int page, int size);

  Future<Either<Failure, Movimentacao>> saveMovimentacao(Movimentacao body);

  Future<Either<Failure, void>> deleteMovimentacao(String id);
}
