import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/pagador.dart';

abstract class PagadorRepository {
  Future<Either<Failure, Pagador>> findPagador(String id);

  Future<Either<Failure, Pagador>> listAllPagador();

  Future<Either<Failure, Pagador>> listAllPagePagador(int page, int size);

  Future<Either<Failure, Pagador>> savePagador(Map<String, dynamic> body);

  Future<Either<Failure, Pagador>> deletePagador(String id);
}
