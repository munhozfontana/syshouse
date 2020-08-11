import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/tipo_renda.dart';
import '../../domain/repositories/tipo_renda_repository.dart';

class TipoRendaRepositoryImpl implements TipoRendaRepository {
  @override
  Future<Either<Failure, TipoRenda>> deleteTipoRenda(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoRenda>> findTipoRenda(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TipoRenda>>> listPageTipoRenda(
      int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TipoRenda>>> listTipoRenda() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoRenda>> saveTipoRenda(Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
