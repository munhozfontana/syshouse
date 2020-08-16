import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/socio_patrimonio.dart';

abstract class SocioPatrimonioRepository {
  Future<Either<Failure, SocioPatrimonio>> findSocioPatrimonio(String id);

  Future<Either<Failure, SocioPatrimonio>> listSocioPatrimonio();

  Future<Either<Failure, SocioPatrimonio>> listPageSocioPatrimonio(
      int page, int size);

  Future<Either<Failure, SocioPatrimonio>> saveSocioPatrimonio(
      Map<String, Object> body);

  Future<Either<Failure, SocioPatrimonio>> deleteSocioPatrimonio(String id);
}
