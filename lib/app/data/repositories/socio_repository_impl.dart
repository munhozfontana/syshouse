import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/socio.dart';
import '../../domain/repositories/socio_repository.dart';

class SocioRepositoryImpl implements SocioRepository {
  @override
  Future<Either<Failure, Socio>> deleteSocio(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Socio>> findSocio(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Socio>> listAllPageSocio(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Socio>> listAllSocio() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Socio>> saveSocio(Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
