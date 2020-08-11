import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/socio.dart';

abstract class SocioRepository {
  Future<Either<Failure, Socio>> findSocio(String id);

  Future<Either<Failure, Socio>> listSocio();

  Future<Either<Failure, Socio>> listPageSocio(int page, int size);

  Future<Either<Failure, Socio>> saveSocio(Map<String, dynamic> body);

  Future<Either<Failure, Socio>> deleteSocio(String id);
}
