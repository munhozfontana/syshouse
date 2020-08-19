import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/despesa.dart';

abstract class DespesaRepository {
  Future<Either<Failure, Despesa>> findDespesa(String id);

  Future<Either<Failure, List<Despesa>>> listDespesa();

  Future<Either<Failure, List<Despesa>>> listPageDespesa(int page, int size);

  Future<Either<Failure, Despesa>> saveDespesa(Despesa body);

  Future<Either<Failure, void>> deleteDespesa(String id);
}
