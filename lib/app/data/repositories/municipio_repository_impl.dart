import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/municipio.dart';
import '../../domain/repositories/municipio_repository.dart';

class MunicipioRepositoryImpl implements MunicipioRepository {
  @override
  Future<Either<Failure, Municipio>> deleteMunicipio(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Municipio>> findMunicipio(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Municipio>> listAllMunicipio() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Municipio>> listAllPageMunicipio(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Municipio>> saveMunicipio(Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
