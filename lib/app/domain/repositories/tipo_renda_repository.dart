import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/tipo_renda.dart';

abstract class TipoRendaRepository {
  Future<Either<Failure, TipoRenda>> findTipoRenda(String id);

  Future<Either<Failure, TipoRenda>> listAllTipoRenda();

  Future<Either<Failure, TipoRenda>> listAllPageTipoRenda(int page, int size);

  Future<Either<Failure, TipoRenda>> saveTipoRenda(Map<String, dynamic> body);

  Future<Either<Failure, TipoRenda>> deleteTipoRenda(String id);
}
