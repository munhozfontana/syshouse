import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/tipo_patrimonio.dart';

abstract class TipoPatrimonioRepository {
  Future<Either<Failure, TipoPatrimonio>> findTipoPatrimonio(String id);

  Future<Either<Failure, TipoPatrimonio>> listTipoPatrimonio();

  Future<Either<Failure, TipoPatrimonio>> listPageTipoPatrimonio(
      int page, int size);

  Future<Either<Failure, TipoPatrimonio>> saveTipoPatrimonio(
      Map<String, dynamic> body);

  Future<Either<Failure, TipoPatrimonio>> deleteTipoPatrimonio(String id);
}
