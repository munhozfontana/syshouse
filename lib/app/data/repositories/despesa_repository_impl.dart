import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/despesa.dart';
import '../../domain/repositories/despesa_repository.dart';

class DespesaRepositoryImpl implements DespesaRepository {
  @override
  Future<Either<Failure, Despesa>> deleteDespesa(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Despesa>> findDespesa(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Despesa>> listDespesa() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Despesa>> listPageDespesa(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Despesa>> saveDespesa(Map<String, Object> body) {
    throw UnimplementedError();
  }
}
