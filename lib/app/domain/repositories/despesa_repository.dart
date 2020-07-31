import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/despesa.dart';

abstract class DespesaRepository {
  Future<Either<Failure, Despesa>> findDespesa(String id);

  Future<Either<Failure, Despesa>> listAllDespesa();

  Future<Either<Failure, Despesa>> listAllPageDespesa(int page, int size);

  Future<Either<Failure, Despesa>> saveDespesa(Map<String, dynamic> body);

  Future<Either<Failure, Despesa>> deleteDespesa(String id);
}
