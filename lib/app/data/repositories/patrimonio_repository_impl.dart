import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/patrimonio.dart';
import '../../domain/repositories/patrimonio_repository.dart';

class PatrimonioRepositoryImpl implements PatrimonioRepository {
  @override
  Future<Either<Failure, Patrimonio>> deletePatrimonio(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Patrimonio>> findPatrimonio(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Patrimonio>> listPagePatrimonio(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Patrimonio>> listPatrimonio() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Patrimonio>> savePatrimonio(Map<String, Object> body) {
    throw UnimplementedError();
  }
}
