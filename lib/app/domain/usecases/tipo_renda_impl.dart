import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/tipo_renda.dart';
import '../repositories/tipo_renda_repository.dart';

class FindTipoRenda implements UseCase<TipoRenda, Params> {
  final TipoRendaRepository tipoRendaRepository;

  FindTipoRenda(this.tipoRendaRepository);

  @override
  Future<Either<Failure, TipoRenda>> call(Params params) {
    return tipoRendaRepository.findTipoRenda(
      params.tipoRenda.id,
    );
  }
}

class ListTipoRenda implements UseCase<List<TipoRenda>, NoParams> {
  final TipoRendaRepository tipoRendaRepository;

  ListTipoRenda(this.tipoRendaRepository);

  @override
  Future<Either<Failure, List<TipoRenda>>> call(NoParams params) {
    return tipoRendaRepository.listTipoRenda();
  }
}

class ListPageTipoRenda implements UseCase<List<TipoRenda>, Params> {
  final TipoRendaRepository tipoRendaRepository;

  ListPageTipoRenda(this.tipoRendaRepository);

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

  SaveTipoRenda(this.tipoRendaRepository);

  @override
  Future<Either<Failure, TipoRenda>> call(Params params) {
    // return tipoRendaRepository.saveTipoRenda(params.tipoRenda);
  }
}

class DeleteTipoRenda implements UseCase<TipoRenda, Params> {
  final TipoRendaRepository tipoRendaRepository;

  DeleteTipoRenda(this.tipoRendaRepository);

  @override
  Future<Either<Failure, TipoRenda>> call(Params params) {
    //  return tipoRendaRepository.
  }
}
