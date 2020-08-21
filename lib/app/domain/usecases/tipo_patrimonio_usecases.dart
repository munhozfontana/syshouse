import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/tipo_patrimonio.dart';
import '../repositories/tipo_patrimonio_repository.dart';

class FindTipoPatrimonio implements UseCase<TipoPatrimonio, Params> {
  final TipoPatrimonioRepository tipoPatrimonioRepository;

  FindTipoPatrimonio({@required this.tipoPatrimonioRepository});

  @override
  Future<Either<Failure, TipoPatrimonio>> call(Params params) {
    return tipoPatrimonioRepository
        .findTipoPatrimonio(params.tipoPatrimonio.id);
  }
}

class ListTipoPatrimonio implements UseCase<List<TipoPatrimonio>, NoParams> {
  final TipoPatrimonioRepository tipoPatrimonioRepository;

  ListTipoPatrimonio({@required this.tipoPatrimonioRepository});

  @override
  Future<Either<Failure, List<TipoPatrimonio>>> call(NoParams params) {
    return tipoPatrimonioRepository.listTipoPatrimonio();
  }
}

class ListPageTipoPatrimonio implements UseCase<List<TipoPatrimonio>, Params> {
  final TipoPatrimonioRepository tipoPatrimonioRepository;

  ListPageTipoPatrimonio({@required this.tipoPatrimonioRepository});

  @override
  Future<Either<Failure, List<TipoPatrimonio>>> call(Params params) {
    return tipoPatrimonioRepository.listPageTipoPatrimonio(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveTipoPatrimonio implements UseCase<TipoPatrimonio, Params> {
  final TipoPatrimonioRepository tipoPatrimonioRepository;

  SaveTipoPatrimonio({@required this.tipoPatrimonioRepository});

  @override
  Future<Either<Failure, TipoPatrimonio>> call(Params params) {
    return tipoPatrimonioRepository.saveTipoPatrimonio(params.tipoPatrimonio);
  }
}

class DeleteTipoPatrimonio implements UseCase<TipoPatrimonio, Params> {
  final TipoPatrimonioRepository tipoPatrimonioRepository;

  DeleteTipoPatrimonio({@required this.tipoPatrimonioRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return tipoPatrimonioRepository
        .deleteTipoPatrimonio(params.tipoPatrimonio.id);
  }
}
