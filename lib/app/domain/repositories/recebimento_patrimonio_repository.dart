import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/recebimento_patrimonio.dart';

abstract class RecebimentoPatrimonioRepository {
  Future<Either<Failure, RecebimentoPatrimonio>> findRecebimentoPatrimonio(
      String id);

  Future<Either<Failure, RecebimentoPatrimonio>> listAllRecebimentoPatrimonio();

  Future<Either<Failure, RecebimentoPatrimonio>>
      listAllPageRecebimentoPatrimonio(int page, int size);

  Future<Either<Failure, RecebimentoPatrimonio>> saveRecebimentoPatrimonio(
      Map<String, dynamic> body);

  Future<Either<Failure, RecebimentoPatrimonio>> deleteRecebimentoPatrimonio(
      String id);
}
