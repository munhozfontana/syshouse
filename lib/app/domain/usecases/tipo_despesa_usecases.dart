import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/tipo_despesa.dart';
import '../repositories/tipo_despesa_repository.dart';

class FindTipoDespesa implements UseCase<TipoDespesa, Params> {
  final TipoDespesaRepository tipoDespesaRepository;

  FindTipoDespesa({@required this.tipoDespesaRepository});

  @override
  Future<Either<Failure, TipoDespesa>> call(Params params) {
    return tipoDespesaRepository.findTipoDespesa(params.tipoDespesaModel.id);
  }
}

class ListTipoDespesa implements UseCase<List<TipoDespesa>, NoParams> {
  final TipoDespesaRepository tipoDespesaRepository;

  ListTipoDespesa({@required this.tipoDespesaRepository});

  @override
  Future<Either<Failure, List<TipoDespesa>>> call(NoParams params) {
    return tipoDespesaRepository.listTipoDespesa();
  }
}

class ListPageTipoDespesa implements UseCase<List<TipoDespesa>, Params> {
  final TipoDespesaRepository tipoDespesaRepository;

  ListPageTipoDespesa({@required this.tipoDespesaRepository});

  @override
  Future<Either<Failure, List<TipoDespesa>>> call(Params params) {
    return tipoDespesaRepository.listPageTipoDespesa(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveTipoDespesa implements UseCase<TipoDespesa, Params> {
  final TipoDespesaRepository tipoDespesaRepository;

  SaveTipoDespesa({@required this.tipoDespesaRepository});

  @override
  Future<Either<Failure, TipoDespesa>> call(Params params) {
    return tipoDespesaRepository.saveTipoDespesa(params.tipoDespesaModel);
  }
}

class DeleteTipoDespesa implements UseCase<TipoDespesa, Params> {
  final TipoDespesaRepository tipoDespesaRepository;

  DeleteTipoDespesa({@required this.tipoDespesaRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return tipoDespesaRepository.deleteTipoDespesa(params.tipoDespesaModel.id);
  }
}
