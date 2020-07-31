import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/dependente.dart';
import '../../domain/repositories/dependente_repository.dart';

class DependenteRepositoryImpl implements DependenteRepository {
  @override
  Future<Either<Failure, Dependente>> deleteDependente(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Dependente>> findDependente(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Dependente>> listAllDependente() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Dependente>> listAllPageDependente(
      int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Dependente>> saveDependente(
      Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
