import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/renda.dart';
import '../repositories/renda_repository.dart';

class FindRenda implements UseCase<Renda, Params> {
  final RendaRepository rendaRepository;

  FindRenda({@required this.rendaRepository});

  @override
  Future<Either<Failure, Renda>> call(Params params) {
    return rendaRepository.findRenda(params.rendaModel.id);
  }
}

class ListRenda implements UseCase<List<Renda>, NoParams> {
  final RendaRepository rendaRepository;

  ListRenda({@required this.rendaRepository});

  @override
  Future<Either<Failure, List<Renda>>> call(NoParams params) {
    return rendaRepository.listRenda();
  }
}

class ListPageRenda implements UseCase<List<Renda>, Params> {
  final RendaRepository rendaRepository;

  ListPageRenda({@required this.rendaRepository});

  @override
  Future<Either<Failure, List<Renda>>> call(Params params) {
    return rendaRepository.listPageRenda(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveRenda implements UseCase<Renda, Params> {
  final RendaRepository rendaRepository;

  SaveRenda({@required this.rendaRepository});

  @override
  Future<Either<Failure, Renda>> call(Params params) {
    return rendaRepository.saveRenda(params.rendaModel);
  }
}

class DeleteRenda implements UseCase<Renda, Params> {
  final RendaRepository rendaRepository;

  DeleteRenda({@required this.rendaRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return rendaRepository.deleteRenda(params.rendaModel.id);
  }
}
