import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/tipo_despesa.dart';

abstract class TipoDespesaRepository {
  Future<Either<Failure, TipoDespesa>> findTipoDespesa(String id);

  Future<Either<Failure, TipoDespesa>> listTipoDespesa();

  Future<Either<Failure, TipoDespesa>> listPageTipoDespesa(int page, int size);

  Future<Either<Failure, TipoDespesa>> saveTipoDespesa(
      Map<String, Object> body);

  Future<Either<Failure, TipoDespesa>> deleteTipoDespesa(String id);
}
