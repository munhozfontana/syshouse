import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/Renda.dart';

abstract class RendaRepository {
  Future<Either<Failure, Renda>> findRenda(String id);

  Future<Either<Failure, Renda>> listRenda();

  Future<Either<Failure, Renda>> listPageRenda(int page, int size);

  Future<Either<Failure, Renda>> saveRenda(Map<String, Object> body);

  Future<Either<Failure, Renda>> deleteRenda(String id);
}
