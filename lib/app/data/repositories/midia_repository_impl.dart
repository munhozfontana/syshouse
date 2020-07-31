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
  Future<Either<Failure, Midia>> listAllMidia() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Midia>> listAllPageMidia(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Midia>> saveMidia(Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
