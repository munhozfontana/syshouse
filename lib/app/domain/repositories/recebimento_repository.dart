import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/Recebimento.dart';

abstract class RecebimentoRepository {
  Future<Either<Failure, Recebimento>> findRecebimento(String id);

  Future<Either<Failure, Recebimento>> listRecebimento();

  Future<Either<Failure, Recebimento>> listPageRecebimento(int page, int size);

  Future<Either<Failure, Recebimento>> saveRecebimento(
      Map<String, dynamic> body);

  Future<Either<Failure, Recebimento>> deleteRecebimento(String id);
}
