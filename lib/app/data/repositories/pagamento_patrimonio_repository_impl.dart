import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/pagamento_patrimonio.dart';
import '../../domain/repositories/pagamento_patrimonio_repository.dart';

class PagamentoPatrimonioRepositoryImpl
    implements PagamentoPatrimonioRepository {
  @override
  Future<Either<Failure, PagamentoPatrimonio>> deletePagamentoPatrimonio(
      String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PagamentoPatrimonio>> findPagamentoPatrimonio(
      String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PagamentoPatrimonio>> listPagamentoPatrimonio() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PagamentoPatrimonio>> listPagePagamentoPatrimonio(
      int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PagamentoPatrimonio>> savePagamentoPatrimonio(
      Map<String, Object> body) {
    throw UnimplementedError();
  }
}
