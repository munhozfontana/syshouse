import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/socio_patrimonio.dart';

abstract class SocioPatrimonioRepository {
  Future<Either<Failure, SocioPatrimonio>> findSocioPatrimonio(String id);

  Future<Either<Failure, List<SocioPatrimonio>>> listSocioPatrimonio();

  Future<Either<Failure, List<SocioPatrimonio>>> listPageSocioPatrimonio(
      int page, int size);

  Future<Either<Failure, SocioPatrimonio>> saveSocioPatrimonio(
      SocioPatrimonio body);

  Future<Either<Failure, void>> deleteSocioPatrimonio(String id);
}
