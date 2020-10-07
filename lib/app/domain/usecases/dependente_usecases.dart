import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/dependente.dart';
import '../repositories/dependente_repository.dart';

class FindDependente implements UseCase<Dependente, Params> {
  final DependenteRepository dependenteRepository;

  FindDependente({@required this.dependenteRepository});

  @override
  Future<Either<Failure, Dependente>> call(Params params) {
    return dependenteRepository.findDependente(params.dependenteModel.id);
  }
}

class ListDependente implements UseCase<List<Dependente>, NoParams> {
  final DependenteRepository dependenteRepository;

  ListDependente({@required this.dependenteRepository});

  @override
  Future<Either<Failure, List<Dependente>>> call(NoParams params) {
    return dependenteRepository.listDependente();
  }
}

class ListPageDependente implements UseCase<List<Dependente>, Params> {
  final DependenteRepository dependenteRepository;

  ListPageDependente({@required this.dependenteRepository});

  @override
  Future<Either<Failure, List<Dependente>>> call(Params params) {
    return dependenteRepository.listPageDependente(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveDependente implements UseCase<Dependente, Params> {
  final DependenteRepository dependenteRepository;

  SaveDependente({@required this.dependenteRepository});

  @override
  Future<Either<Failure, Dependente>> call(Params params) {
    return dependenteRepository.saveDependente(params.dependenteModel);
  }
}

class DeleteDependente implements UseCase<Dependente, Params> {
  final DependenteRepository dependenteRepository;

  DeleteDependente({@required this.dependenteRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return dependenteRepository.deleteDependente(params.dependenteModel.id);
  }
}
