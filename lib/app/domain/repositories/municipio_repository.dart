import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/municipio.dart';

abstract class MunicipioRepository {
  Future<Either<Failure, Municipio>> findMunicipio(String id);

  Future<Either<Failure, List<Municipio>>> listMunicipio();

  Future<Either<Failure, List<Municipio>>> listPageMunicipio(
      int page, int size);

  Future<Either<Failure, Municipio>> saveMunicipio(Municipio body);

  Future<Either<Failure, void>> deleteMunicipio(String id);
}
