import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/recebimento_patrimonio.dart';

abstract class RecebimentoPatrimonioRepository {
  Future<Either<Failure, RecebimentoPatrimonio>> findRecebimentoPatrimonio(
      String id);

  Future<Either<Failure, List<RecebimentoPatrimonio>>>
      listRecebimentoPatrimonio();

  Future<Either<Failure, List<RecebimentoPatrimonio>>>
      listPageRecebimentoPatrimonio(int page, int size);

  Future<Either<Failure, RecebimentoPatrimonio>> saveRecebimentoPatrimonio(
      RecebimentoPatrimonio body);

  Future<Either<Failure, void>> deleteRecebimentoPatrimonio(String id);
}
