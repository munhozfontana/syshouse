import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/patrimonio.dart';
import '../repositories/patrimonio_repository.dart';

class FindPatrimonio implements UseCase<Patrimonio, Params> {
  final PatrimonioRepository patrimonioRepository;

  FindPatrimonio({@required this.patrimonioRepository});

  @override
  Future<Either<Failure, Patrimonio>> call(Params params) {
    return patrimonioRepository.findPatrimonio(params.patrimonioModel.id);
  }
}

class ListPatrimonio implements UseCase<List<Patrimonio>, NoParams> {
  final PatrimonioRepository patrimonioRepository;

  ListPatrimonio({@required this.patrimonioRepository});

  @override
  Future<Either<Failure, List<Patrimonio>>> call(NoParams params) {
    return patrimonioRepository.listPatrimonio();
  }
}

class ListPagePatrimonio implements UseCase<List<Patrimonio>, Params> {
  final PatrimonioRepository patrimonioRepository;

  ListPagePatrimonio({@required this.patrimonioRepository});

  @override
  Future<Either<Failure, List<Patrimonio>>> call(Params params) {
    return patrimonioRepository.listPagePatrimonio(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SavePatrimonio implements UseCase<Patrimonio, Params> {
  final PatrimonioRepository patrimonioRepository;

  SavePatrimonio({@required this.patrimonioRepository});

  @override
  Future<Either<Failure, Patrimonio>> call(Params params) {
    return patrimonioRepository.savePatrimonio(params.patrimonioModel);
  }
}

class DeletePatrimonio implements UseCase<Patrimonio, Params> {
  final PatrimonioRepository patrimonioRepository;

  DeletePatrimonio({@required this.patrimonioRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return patrimonioRepository.deletePatrimonio(params.patrimonioModel.id);
  }
}
