import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/pagador.dart';
import '../../domain/repositories/pagador_repository.dart';

class PagadorRepositoryImpl implements PagadorRepository {
  @override
  Future<Either<Failure, Pagador>> deletePagador(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Pagador>> findPagador(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Pagador>> listAllPagador() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Pagador>> listAllPagePagador(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Pagador>> savePagador(Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
