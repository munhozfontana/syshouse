import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/midia.dart';

abstract class MidiaRepository {
  Future<Either<Failure, Midia>> findMidia(String id);

  Future<Either<Failure, List<Midia>>> listMidia();

  Future<Either<Failure, List<Midia>>> listPageMidia(int page, int size);

  Future<Either<Failure, Midia>> saveMidia(Midia body);

  Future<Either<Failure, void>> deleteMidia(String id);
}
