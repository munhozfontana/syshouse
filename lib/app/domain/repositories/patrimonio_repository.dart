import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/dependente.dart';

abstract class DependenteRepository {
  Future<Either<Failure, Dependente>> findDependente(String id);

  Future<Either<Failure, Dependente>> listAllDependente();

  Future<Either<Failure, Dependente>> listAllPageDependente(int page, int size);

  Future<Either<Failure, Dependente>> saveDependente(Map<String, dynamic> body);

  Future<Either<Failure, Dependente>> deleteDependente(String id);
}
