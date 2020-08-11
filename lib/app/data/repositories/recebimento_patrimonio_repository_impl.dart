import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/recebimento_patrimonio.dart';
import '../../domain/repositories/recebimento_patrimonio_repository.dart';

class RecebimentoPatrimonioRepositoryImpl
    implements RecebimentoPatrimonioRepository {
  @override
  Future<Either<Failure, RecebimentoPatrimonio>> deleteRecebimentoPatrimonio(
      String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RecebimentoPatrimonio>> findRecebimentoPatrimonio(
      String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RecebimentoPatrimonio>> listPageRecebimentoPatrimonio(
      int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RecebimentoPatrimonio>> listRecebimentoPatrimonio() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RecebimentoPatrimonio>> saveRecebimentoPatrimonio(
      Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
