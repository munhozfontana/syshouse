import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/recebimento.dart';

abstract class RecebimentoRepository {
  Future<Either<Failure, Recebimento>> findRecebimento(String id);

  Future<Either<Failure, List<Recebimento>>> listRecebimento();

  Future<Either<Failure, List<Recebimento>>> listPageRecebimento(
      int page, int size);

  Future<Either<Failure, Recebimento>> saveRecebimento(Recebimento body);

  Future<Either<Failure, void>> deleteRecebimento(String id);
}
