import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/pagador.dart';

abstract class PagadorRepository {
  Future<Either<Failure, Pagador>> findPagador(String id);

  Future<Either<Failure, Pagador>> listPagador();

  Future<Either<Failure, Pagador>> listPagePagador(int page, int size);

  Future<Either<Failure, Pagador>> savePagador(Map<String, Object> body);

  Future<Either<Failure, Pagador>> deletePagador(String id);
}
