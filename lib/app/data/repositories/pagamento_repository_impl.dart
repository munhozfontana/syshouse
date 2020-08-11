import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/pagamento.dart';
import '../../domain/repositories/pagamento_repository.dart';

class PagamentoRepositoryImpl implements PagamentoRepository {
  @override
  Future<Either<Failure, Pagamento>> deletePagamento(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Pagamento>> findPagamento(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Pagamento>> listPagamento() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Pagamento>> listPagePagamento(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Pagamento>> savePagamento(Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
