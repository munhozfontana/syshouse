import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/tipo_despesa.dart';

abstract class TipoDespesaRepository {
  Future<Either<Failure, TipoDespesa>> findTipoDespesa(String id);

  Future<Either<Failure, List<TipoDespesa>>> listTipoDespesa();

  Future<Either<Failure, List<TipoDespesa>>> listPageTipoDespesa(
      int page, int size);

  Future<Either<Failure, TipoDespesa>> saveTipoDespesa(TipoDespesa body);

  Future<Either<Failure, void>> deleteTipoDespesa(String id);
}
