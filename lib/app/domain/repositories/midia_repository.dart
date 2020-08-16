import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/midia.dart';

abstract class MidiaRepository {
  Future<Either<Failure, Midia>> findMidia(String id);

  Future<Either<Failure, Midia>> listMidia();

  Future<Either<Failure, Midia>> listPageMidia(int page, int size);

  Future<Either<Failure, Midia>> saveMidia(Map<String, Object> body);

  Future<Either<Failure, Midia>> deleteMidia(String id);
}
