import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/movimentacao.dart';
import "../../domain/repositories/movimentacao_repository.dart";

class MovimentacaoRepositoryImpl implements MovimentacaoRepository {
  @override
  Future<Either<Failure, Movimentacao>> deleteMovimentacao(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Movimentacao>> findMovimentacao(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Movimentacao>> listMovimentacao() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Movimentacao>> listPageMovimentacao(
      int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Movimentacao>> saveMovimentacao(
      Map<String, Object> body) {
    throw UnimplementedError();
  }
}
