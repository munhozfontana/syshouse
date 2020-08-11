import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/municipio.dart';

abstract class MunicipioRepository {
  Future<Either<Failure, Municipio>> findMunicipio(String id);

  Future<Either<Failure, Municipio>> listMunicipio();

  Future<Either<Failure, Municipio>> listPageMunicipio(int page, int size);

  Future<Either<Failure, Municipio>> saveMunicipio(Map<String, dynamic> body);

  Future<Either<Failure, Municipio>> deleteMunicipio(String id);
}
