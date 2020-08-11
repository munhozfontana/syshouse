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
    throw UnimplementedError();
  }
}
