import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/Renda.dart';
import '../../domain/repositories/renda_repository.dart';

class RendaRepositoryImpl implements RendaRepository {
  @override
  Future<Either<Failure, Renda>> deleteRenda(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Renda>> findRenda(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Renda>> listPageRenda(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Renda>> listRenda() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Renda>> saveRenda(Map<String, Object> body) {
    throw UnimplementedError();
  }
}
