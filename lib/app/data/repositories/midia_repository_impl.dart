import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/midia.dart';
import '../../domain/repositories/midia_repository.dart';

class MidiaRepositoryImpl implements MidiaRepository {
  @override
  Future<Either<Failure, Midia>> deleteMidia(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Midia>> findMidia(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Midia>> listMidia() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Midia>> listPageMidia(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Midia>> saveMidia(Map<String, Object> body) {
    throw UnimplementedError();
  }
}
