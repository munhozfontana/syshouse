import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/patrimonio.dart';

abstract class PatrimonioRepository {
  Future<Either<Failure, Patrimonio>> findPatrimonio(String id);

  Future<Either<Failure, List<Patrimonio>>> listPatrimonio();

  Future<Either<Failure, List<Patrimonio>>> listPagePatrimonio(
      int page, int size);

  Future<Either<Failure, Patrimonio>> savePatrimonio(Patrimonio body);

  Future<Either<Failure, void>> deletePatrimonio(String id);
}
