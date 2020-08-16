import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movimentacao.dart';

abstract class MovimentacaoRepository {
  Future<Either<Failure, Movimentacao>> findMovimentacao(String id);

  Future<Either<Failure, Movimentacao>> listMovimentacao();

  Future<Either<Failure, Movimentacao>> listPageMovimentacao(
      int page, int size);

  Future<Either<Failure, Movimentacao>> saveMovimentacao(
      Map<String, Object> body);

  Future<Either<Failure, Movimentacao>> deleteMovimentacao(String id);
}
