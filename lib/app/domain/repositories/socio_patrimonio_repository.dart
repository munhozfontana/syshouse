import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/socio_patrimonio.dart';

abstract class SocioPatrimonioRepository {
  Future<Either<Failure, SocioPatrimonio>> findSocioPatrimonio(String id);

  Future<Either<Failure, SocioPatrimonio>> listAllSocioPatrimonio();

  Future<Either<Failure, SocioPatrimonio>> listAllPageSocioPatrimonio(
      int page, int size);

  Future<Either<Failure, SocioPatrimonio>> saveSocioPatrimonio(
      Map<String, dynamic> body);

  Future<Either<Failure, SocioPatrimonio>> deleteSocioPatrimonio(String id);
}
