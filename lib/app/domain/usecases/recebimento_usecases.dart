import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/recebimento.dart';
import '../repositories/recebimento_repository.dart';

class FindRecebimento implements UseCase<Recebimento, Params> {
  final RecebimentoRepository recebimentoRepository;

  FindRecebimento({@required this.recebimentoRepository});

  @override
  Future<Either<Failure, Recebimento>> call(Params params) {
    return recebimentoRepository.findRecebimento(params.recebimentoModel.id);
  }
}

class ListRecebimento implements UseCase<List<Recebimento>, NoParams> {
  final RecebimentoRepository recebimentoRepository;

  ListRecebimento({@required this.recebimentoRepository});

  @override
  Future<Either<Failure, List<Recebimento>>> call(NoParams params) {
    return recebimentoRepository.listRecebimento();
  }
}

class ListPageRecebimento implements UseCase<List<Recebimento>, Params> {
  final RecebimentoRepository recebimentoRepository;

  ListPageRecebimento({@required this.recebimentoRepository});

  @override
  Future<Either<Failure, List<Recebimento>>> call(Params params) {
    return recebimentoRepository.listPageRecebimento(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveRecebimento implements UseCase<Recebimento, Params> {
  final RecebimentoRepository recebimentoRepository;

  SaveRecebimento({@required this.recebimentoRepository});

  @override
  Future<Either<Failure, Recebimento>> call(Params params) {
    return recebimentoRepository.saveRecebimento(params.recebimentoModel);
  }
}

class DeleteRecebimento implements UseCase<Recebimento, Params> {
  final RecebimentoRepository recebimentoRepository;

  DeleteRecebimento({@required this.recebimentoRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return recebimentoRepository.deleteRecebimento(params.recebimentoModel.id);
  }
}
