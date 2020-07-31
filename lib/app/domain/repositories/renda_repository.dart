import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/Renda.dart';

abstract class RendaRepository {
  Future<Either<Failure, Renda>> findRenda(String id);

  Future<Either<Failure, Renda>> listAllRenda();

  Future<Either<Failure, Renda>> listAllPageRenda(int page, int size);

  Future<Either<Failure, Renda>> saveRenda(Map<String, dynamic> body);

  Future<Either<Failure, Renda>> deleteRenda(String id);
}
