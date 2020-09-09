import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/tipo_renda.dart';
import '../repositories/tipo_renda_repository.dart';

class FindTipoRenda implements UseCase<TipoRenda, Params> {
  final TipoRendaRepository tipoRendaRepository;

  FindTipoRenda({@required this.tipoRendaRepository});

  @override
  Future<Either<Failure, TipoRenda>> call(Params params) {
    return tipoRendaRepository.findTipoRenda(params.tipoRendaModel.id);
  }
}

class ListTipoRenda implements UseCase<List<TipoRenda>, NoParams> {
  final TipoRendaRepository tipoRendaRepository;

  ListTipoRenda({@required this.tipoRendaRepository});

  @override
  Future<Either<Failure, List<TipoRenda>>> call(NoParams params) {
    return tipoRendaRepository.listTipoRenda();
  }
}

class ListPageTipoRenda implements UseCase<List<TipoRenda>, Params> {
  final TipoRendaRepository tipoRendaRepository;

  ListPageTipoRenda({@required this.tipoRendaRepository});

  @override
  Future<Either<Failure, List<TipoRenda>>> call(Params params) {
    return tipoRendaRepository.listPageTipoRenda(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveTipoRenda implements UseCase<TipoRenda, Params> {
  final TipoRendaRepository tipoRendaRepository;

  SaveTipoRenda({@required this.tipoRendaRepository});

  @override
  Future<Either<Failure, TipoRenda>> call(Params params) {
    return tipoRendaRepository.saveTipoRenda(params.tipoRendaModel);
  }
}

class DeleteTipoRenda implements UseCase<TipoRenda, Params> {
  final TipoRendaRepository tipoRendaRepository;

  DeleteTipoRenda({@required this.tipoRendaRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return tipoRendaRepository.deleteTipoRenda(params.tipoRendaModel.id);
  }
}
