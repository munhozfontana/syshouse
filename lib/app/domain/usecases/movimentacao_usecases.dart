import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/movimentacao.dart';
import '../repositories/movimentacao_repository.dart';

class FindMovimentacao implements UseCase<Movimentacao, Params> {
  final MovimentacaoRepository movimentacaoRepository;

  FindMovimentacao({@required this.movimentacaoRepository});

  @override
  Future<Either<Failure, Movimentacao>> call(Params params) {
    return movimentacaoRepository.findMovimentacao(params.movimentacaoModel.id);
  }
}

class ListMovimentacao implements UseCase<List<Movimentacao>, NoParams> {
  final MovimentacaoRepository movimentacaoRepository;

  ListMovimentacao({@required this.movimentacaoRepository});

  @override
  Future<Either<Failure, List<Movimentacao>>> call(NoParams params) {
    return movimentacaoRepository.listMovimentacao();
  }
}

class ListPageMovimentacao implements UseCase<List<Movimentacao>, Params> {
  final MovimentacaoRepository movimentacaoRepository;

  ListPageMovimentacao({@required this.movimentacaoRepository});

  @override
  Future<Either<Failure, List<Movimentacao>>> call(Params params) {
    return movimentacaoRepository.listPageMovimentacao(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveMovimentacao implements UseCase<Movimentacao, Params> {
  final MovimentacaoRepository movimentacaoRepository;

  SaveMovimentacao({@required this.movimentacaoRepository});

  @override
  Future<Either<Failure, Movimentacao>> call(Params params) {
    return movimentacaoRepository.saveMovimentacao(params.movimentacaoModel);
  }
}

class DeleteMovimentacao implements UseCase<Movimentacao, Params> {
  final MovimentacaoRepository movimentacaoRepository;

  DeleteMovimentacao({@required this.movimentacaoRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return movimentacaoRepository
        .deleteMovimentacao(params.movimentacaoModel.id);
  }
}
