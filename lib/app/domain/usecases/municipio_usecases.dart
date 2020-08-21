import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/municipio.dart';
import '../repositories/municipio_repository.dart';

class FindMunicipio implements UseCase<Municipio, Params> {
  final MunicipioRepository municipioRepository;

  FindMunicipio({@required this.municipioRepository});

  @override
  Future<Either<Failure, Municipio>> call(Params params) {
    return municipioRepository.findMunicipio(params.municipio.id);
  }
}

class ListMunicipio implements UseCase<List<Municipio>, NoParams> {
  final MunicipioRepository municipioRepository;

  ListMunicipio({@required this.municipioRepository});

  @override
  Future<Either<Failure, List<Municipio>>> call(NoParams params) {
    return municipioRepository.listMunicipio();
  }
}

class ListPageMunicipio implements UseCase<List<Municipio>, Params> {
  final MunicipioRepository municipioRepository;

  ListPageMunicipio({@required this.municipioRepository});

  @override
  Future<Either<Failure, List<Municipio>>> call(Params params) {
    return municipioRepository.listPageMunicipio(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveMunicipio implements UseCase<Municipio, Params> {
  final MunicipioRepository municipioRepository;

  SaveMunicipio({@required this.municipioRepository});

  @override
  Future<Either<Failure, Municipio>> call(Params params) {
    return municipioRepository.saveMunicipio(params.municipio);
  }
}

class DeleteMunicipio implements UseCase<Municipio, Params> {
  final MunicipioRepository municipioRepository;

  DeleteMunicipio({@required this.municipioRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return municipioRepository.deleteMunicipio(params.municipio.id);
  }
}
