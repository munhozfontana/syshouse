import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/patrimonio.dart';

abstract class PatrimonioRepository {
  Future<Either<Failure, Patrimonio>> findPatrimonio(String id);

  Future<Either<Failure, Patrimonio>> listAllPatrimonio();

  Future<Either<Failure, Patrimonio>> listAllPagePatrimonio(int page, int size);

  Future<Either<Failure, Patrimonio>> savePatrimonio(Map<String, dynamic> body);

  Future<Either<Failure, Patrimonio>> deletePatrimonio(String id);
}
