import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/midia.dart';

abstract class MidiaRepository {
  Future<Either<Failure, Midia>> findMidia(String id);

  Future<Either<Failure, Midia>> listAllMidia();

  Future<Either<Failure, Midia>> listAllPageMidia(int page, int size);

  Future<Either<Failure, Midia>> saveMidia(Map<String, dynamic> body);

  Future<Either<Failure, Midia>> deleteMidia(String id);
}
