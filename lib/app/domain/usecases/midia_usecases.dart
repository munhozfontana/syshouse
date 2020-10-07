import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/midia.dart';
import '../repositories/midia_repository.dart';

class FindMidia implements UseCase<Midia, Params> {
  final MidiaRepository midiaRepository;

  FindMidia({@required this.midiaRepository});

  @override
  Future<Either<Failure, Midia>> call(Params params) {
    return midiaRepository.findMidia(params.midiaModel.id);
  }
}

class ListMidia implements UseCase<List<Midia>, NoParams> {
  final MidiaRepository midiaRepository;

  ListMidia({@required this.midiaRepository});

  @override
  Future<Either<Failure, List<Midia>>> call(NoParams params) {
    return midiaRepository.listMidia();
  }
}

class ListPageMidia implements UseCase<List<Midia>, Params> {
  final MidiaRepository midiaRepository;

  ListPageMidia({@required this.midiaRepository});

  @override
  Future<Either<Failure, List<Midia>>> call(Params params) {
    return midiaRepository.listPageMidia(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveMidia implements UseCase<Midia, Params> {
  final MidiaRepository midiaRepository;

  SaveMidia({@required this.midiaRepository});

  @override
  Future<Either<Failure, Midia>> call(Params params) {
    return midiaRepository.saveMidia(params.midiaModel);
  }
}

class DeleteMidia implements UseCase<Midia, Params> {
  final MidiaRepository midiaRepository;

  DeleteMidia({@required this.midiaRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return midiaRepository.deleteMidia(params.midiaModel.id);
  }
}
