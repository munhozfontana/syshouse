import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/despesa.dart';
import '../repositories/despesa_repository.dart';

class FindDespesa implements UseCase<Despesa, Params> {
  final DespesaRepository despesaRepository;

  FindDespesa({@required this.despesaRepository});

  @override
  Future<Either<Failure, Despesa>> call(Params params) {
    return despesaRepository.findDespesa(params.despesaModel.id);
  }
}

class ListDespesa implements UseCase<List<Despesa>, NoParams> {
  final DespesaRepository despesaRepository;

  ListDespesa({@required this.despesaRepository});

  @override
  Future<Either<Failure, List<Despesa>>> call(NoParams params) {
    return despesaRepository.listDespesa();
  }
}

class ListPageDespesa implements UseCase<List<Despesa>, Params> {
  final DespesaRepository despesaRepository;

  ListPageDespesa({@required this.despesaRepository});

  @override
  Future<Either<Failure, List<Despesa>>> call(Params params) {
    return despesaRepository.listPageDespesa(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveDespesa implements UseCase<Despesa, Params> {
  final DespesaRepository despesaRepository;

  SaveDespesa({@required this.despesaRepository});

  @override
  Future<Either<Failure, Despesa>> call(Params params) {
    return despesaRepository.saveDespesa(params.despesaModel);
  }
}

class DeleteDespesa implements UseCase<Despesa, Params> {
  final DespesaRepository despesaRepository;

  DeleteDespesa({@required this.despesaRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return despesaRepository.deleteDespesa(params.despesaModel.id);
  }
}
