import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/pagador.dart';

abstract class PagadorRepository {
  Future<Either<Failure, Pagador>> findPagador(String id);

  Future<Either<Failure, List<Pagador>>> listPagador();

  Future<Either<Failure, List<Pagador>>> listPagePagador(int page, int size);

  Future<Either<Failure, Pagador>> savePagador(Pagador body);

  Future<Either<Failure, void>> deletePagador(String id);
}
