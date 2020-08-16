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
  Future<Either<Failure, SocioPatrimonio>> listPageSocioPatrimonio(
      int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SocioPatrimonio>> listSocioPatrimonio() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SocioPatrimonio>> saveSocioPatrimonio(
      Map<String, Object> body) {
    throw UnimplementedError();
  }
}
