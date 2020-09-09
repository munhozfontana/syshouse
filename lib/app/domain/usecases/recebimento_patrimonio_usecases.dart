import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/recebimento_patrimonio.dart';
import '../repositories/recebimento_patrimonio_repository.dart';

class FindRecebimentoPatrimonio
    implements UseCase<RecebimentoPatrimonio, Params> {
  final RecebimentoPatrimonioRepository recebimentopatrimonioRepository;

  FindRecebimentoPatrimonio({@required this.recebimentopatrimonioRepository});

  @override
  Future<Either<Failure, RecebimentoPatrimonio>> call(Params params) {
    return recebimentopatrimonioRepository
        .findRecebimentoPatrimonio(params.recebimentoPatrimonioModel.id);
  }
}

class ListRecebimentoPatrimonio
    implements UseCase<List<RecebimentoPatrimonio>, NoParams> {
  final RecebimentoPatrimonioRepository recebimentopatrimonioRepository;

  ListRecebimentoPatrimonio({@required this.recebimentopatrimonioRepository});

  @override
  Future<Either<Failure, List<RecebimentoPatrimonio>>> call(NoParams params) {
    return recebimentopatrimonioRepository.listRecebimentoPatrimonio();
  }
}

class ListPageRecebimentoPatrimonio
    implements UseCase<List<RecebimentoPatrimonio>, Params> {
  final RecebimentoPatrimonioRepository recebimentopatrimonioRepository;

  ListPageRecebimentoPatrimonio(
      {@required this.recebimentopatrimonioRepository});

  @override
  Future<Either<Failure, List<RecebimentoPatrimonio>>> call(Params params) {
    return recebimentopatrimonioRepository.listPageRecebimentoPatrimonio(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveRecebimentoPatrimonio
    implements UseCase<RecebimentoPatrimonio, Params> {
  final RecebimentoPatrimonioRepository recebimentopatrimonioRepository;

  SaveRecebimentoPatrimonio({@required this.recebimentopatrimonioRepository});

  @override
  Future<Either<Failure, RecebimentoPatrimonio>> call(Params params) {
    return recebimentopatrimonioRepository
        .saveRecebimentoPatrimonio(params.recebimentoPatrimonioModel);
  }
}

class DeleteRecebimentoPatrimonio
    implements UseCase<RecebimentoPatrimonio, Params> {
  final RecebimentoPatrimonioRepository recebimentopatrimonioRepository;

  DeleteRecebimentoPatrimonio({@required this.recebimentopatrimonioRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return recebimentopatrimonioRepository
        .deleteRecebimentoPatrimonio(params.recebimentoPatrimonioModel.id);
  }
}
