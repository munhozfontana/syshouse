import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/socio_patrimonio.dart';
import '../../domain/repositories/socio_patrimonio_repository.dart';

class SocioPatrimonioRepositoryImpl implements SocioPatrimonioRepository {
  @override
  Future<Either<Failure, SocioPatrimonio>> deleteSocioPatrimonio(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SocioPatrimonio>> findSocioPatrimonio(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SocioPatrimonio>> listAllPageSocioPatrimonio(
      int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SocioPatrimonio>> listAllSocioPatrimonio() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SocioPatrimonio>> saveSocioPatrimonio(
      Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
