import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/renda.dart';

abstract class RendaRepository {
  Future<Either<Failure, Renda>> findRenda(String id);

  Future<Either<Failure, List<Renda>>> listRenda();

  Future<Either<Failure, List<Renda>>> listPageRenda(int page, int size);

  Future<Either<Failure, Renda>> saveRenda(Renda body);

  Future<Either<Failure, void>> deleteRenda(String id);
}
