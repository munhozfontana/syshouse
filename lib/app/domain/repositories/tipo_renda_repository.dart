import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/tipo_renda.dart';

abstract class TipoRendaRepository {
  Future<Either<Failure, TipoRenda>> findTipoRenda(
    String id,
  );

  Future<Either<Failure, List<TipoRenda>>> listTipoRenda();

  Future<Either<Failure, List<TipoRenda>>> listPageTipoRenda(
    int page,
    int size,
  );

  Future<Either<Failure, TipoRenda>> saveTipoRenda(
    TipoRenda body,
  );

  Future<Either<Failure, TipoRenda>> deleteTipoRenda(
    String id,
  );
}
