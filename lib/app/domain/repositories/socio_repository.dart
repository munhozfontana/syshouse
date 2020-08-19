import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/socio.dart';

abstract class SocioRepository {
  Future<Either<Failure, Socio>> findSocio(String id);

  Future<Either<Failure, List<Socio>>> listSocio();

  Future<Either<Failure, List<Socio>>> listPageSocio(int page, int size);

  Future<Either<Failure, Socio>> saveSocio(Socio body);

  Future<Either<Failure, void>> deleteSocio(String id);
}
