import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/tipo_patrimonio.dart';

abstract class TipoPatrimonioRepository {
  Future<Either<Failure, TipoPatrimonio>> findTipoPatrimonio(String id);

  Future<Either<Failure, List<TipoPatrimonio>>> listTipoPatrimonio();

  Future<Either<Failure, List<TipoPatrimonio>>> listPageTipoPatrimonio(
      int page, int size);

  Future<Either<Failure, TipoPatrimonio>> saveTipoPatrimonio(
      TipoPatrimonio body);

  Future<Either<Failure, void>> deleteTipoPatrimonio(String id);
}
