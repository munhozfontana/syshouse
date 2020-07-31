import 'package:dartz/dartz.dart';
import 'package:syshouse/app/domain/entities/tipo_despesa.dart';
import 'package:syshouse/app/domain/repositories/tipo_despesa_repository.dart';
import 'package:syshouse/core/error/failure.dart';

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
  Future<Either<Failure, TipoDespesa>> listAllPageTipoDespesa(
      int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoDespesa>> listAllTipoDespesa() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TipoDespesa>> saveTipoDespesa(
      Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
