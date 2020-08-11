import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/tipo_despesa.dart';
import '../../domain/repositories/tipo_despesa_repository.dart';

class TipoDespesaRepositoryImpl implements TipoDespesaRepository {
  @override
  Future<Either<Failure, TipoDespesa>> deleteTipoDespesa(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoDespesa>> findTipoDespesa(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoDespesa>> listPageTipoDespesa(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoDespesa>> listTipoDespesa() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoDespesa>> saveTipoDespesa(
      Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
