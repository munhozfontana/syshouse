import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/Recebimento.dart';
import '../../domain/repositories/recebimento_repository.dart';

class RecebimentoRepositoryImpl implements RecebimentoRepository {
  @override
  Future<Either<Failure, Recebimento>> deleteRecebimento(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Recebimento>> findRecebimento(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Recebimento>> listPageRecebimento(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Recebimento>> listRecebimento() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Recebimento>> saveRecebimento(
      Map<String, Object> body) {
    throw UnimplementedError();
  }
}
