import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/tipo_patrimonio.dart';
import '../../domain/repositories/tipo_patrimonio_repository.dart';

class TipoPatrimonioRepositoryImpl implements TipoPatrimonioRepository {
  @override
  Future<Either<Failure, TipoPatrimonio>> deleteTipoPatrimonio(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoPatrimonio>> findTipoPatrimonio(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoPatrimonio>> listPageTipoPatrimonio(
      int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoPatrimonio>> listTipoPatrimonio() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoPatrimonio>> saveTipoPatrimonio(
      Map<String, Object> body) {
    throw UnimplementedError();
  }
}
