import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/socio.dart';
import '../repositories/socio_repository.dart';

class FindSocio implements UseCase<Socio, Params> {
  final SocioRepository socioRepository;

  FindSocio({@required this.socioRepository});

  @override
  Future<Either<Failure, Socio>> call(Params params) {
    return socioRepository.findSocio(params.socio.id);
  }
}

class ListSocio implements UseCase<List<Socio>, NoParams> {
  final SocioRepository socioRepository;

  ListSocio({@required this.socioRepository});

  @override
  Future<Either<Failure, List<Socio>>> call(NoParams params) {
    return socioRepository.listSocio();
  }
}

class ListPageSocio implements UseCase<List<Socio>, Params> {
  final SocioRepository socioRepository;

  ListPageSocio({@required this.socioRepository});

  @override
  Future<Either<Failure, List<Socio>>> call(Params params) {
    return socioRepository.listPageSocio(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveSocio implements UseCase<Socio, Params> {
  final SocioRepository socioRepository;

  SaveSocio({@required this.socioRepository});

  @override
  Future<Either<Failure, Socio>> call(Params params) {
    return socioRepository.saveSocio(params.socio);
  }
}

class DeleteSocio implements UseCase<Socio, Params> {
  final SocioRepository socioRepository;

  DeleteSocio({@required this.socioRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return socioRepository.deleteSocio(params.socio.id);
  }
}
