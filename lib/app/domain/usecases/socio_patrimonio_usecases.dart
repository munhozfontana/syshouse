import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/socio_patrimonio.dart';
import '../repositories/socio_patrimonio_repository.dart';

class FindSocioPatrimonio implements UseCase<SocioPatrimonio, Params> {
  final SocioPatrimonioRepository sociopatrimonioRepository;

  FindSocioPatrimonio({@required this.sociopatrimonioRepository});

  @override
  Future<Either<Failure, SocioPatrimonio>> call(Params params) {
    return sociopatrimonioRepository
        .findSocioPatrimonio(params.socioPatrimonio.id);
  }
}

class ListSocioPatrimonio implements UseCase<List<SocioPatrimonio>, NoParams> {
  final SocioPatrimonioRepository sociopatrimonioRepository;

  ListSocioPatrimonio({@required this.sociopatrimonioRepository});

  @override
  Future<Either<Failure, List<SocioPatrimonio>>> call(NoParams params) {
    return sociopatrimonioRepository.listSocioPatrimonio();
  }
}

class ListPageSocioPatrimonio
    implements UseCase<List<SocioPatrimonio>, Params> {
  final SocioPatrimonioRepository sociopatrimonioRepository;

  ListPageSocioPatrimonio({@required this.sociopatrimonioRepository});

  @override
  Future<Either<Failure, List<SocioPatrimonio>>> call(Params params) {
    return sociopatrimonioRepository.listPageSocioPatrimonio(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveSocioPatrimonio implements UseCase<SocioPatrimonio, Params> {
  final SocioPatrimonioRepository sociopatrimonioRepository;

  SaveSocioPatrimonio({@required this.sociopatrimonioRepository});

  @override
  Future<Either<Failure, SocioPatrimonio>> call(Params params) {
    return sociopatrimonioRepository
        .saveSocioPatrimonio(params.socioPatrimonio);
  }
}

class DeleteSocioPatrimonio implements UseCase<SocioPatrimonio, Params> {
  final SocioPatrimonioRepository sociopatrimonioRepository;

  DeleteSocioPatrimonio({@required this.sociopatrimonioRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return sociopatrimonioRepository
        .deleteSocioPatrimonio(params.socioPatrimonio.id);
  }
}
