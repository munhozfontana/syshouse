import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/dependente.dart';

abstract class DependenteRepository {
  Future<Either<Failure, Dependente>> findDependente(String id);

  Future<Either<Failure, List<Dependente>>> listDependente();

  Future<Either<Failure, List<Dependente>>> listPageDependente(
      int page, int size);

  Future<Either<Failure, Dependente>> saveDependente(Dependente body);

  Future<Either<Failure, void>> deleteDependente(String id);
}
