import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/pagamento_patrimonio.dart';
import '../repositories/pagamento_patrimonio_repository.dart';

class FindPagamentoPatrimonio implements UseCase<PagamentoPatrimonio, Params> {
  final PagamentoPatrimonioRepository pagamentopatrimonioRepository;

  FindPagamentoPatrimonio({@required this.pagamentopatrimonioRepository});

  @override
  Future<Either<Failure, PagamentoPatrimonio>> call(Params params) {
    return pagamentopatrimonioRepository
        .findPagamentoPatrimonio(params.pagamentoPatrimonioModel.id);
  }
}

class ListPagamentoPatrimonio
    implements UseCase<List<PagamentoPatrimonio>, NoParams> {
  final PagamentoPatrimonioRepository pagamentopatrimonioRepository;

  ListPagamentoPatrimonio({@required this.pagamentopatrimonioRepository});

  @override
  Future<Either<Failure, List<PagamentoPatrimonio>>> call(NoParams params) {
    return pagamentopatrimonioRepository.listPagamentoPatrimonio();
  }
}

class ListPagePagamentoPatrimonio
    implements UseCase<List<PagamentoPatrimonio>, Params> {
  final PagamentoPatrimonioRepository pagamentopatrimonioRepository;

  ListPagePagamentoPatrimonio({@required this.pagamentopatrimonioRepository});

  @override
  Future<Either<Failure, List<PagamentoPatrimonio>>> call(Params params) {
    return pagamentopatrimonioRepository.listPagePagamentoPatrimonio(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SavePagamentoPatrimonio implements UseCase<PagamentoPatrimonio, Params> {
  final PagamentoPatrimonioRepository pagamentopatrimonioRepository;

  SavePagamentoPatrimonio({@required this.pagamentopatrimonioRepository});

  @override
  Future<Either<Failure, PagamentoPatrimonio>> call(Params params) {
    return pagamentopatrimonioRepository
        .savePagamentoPatrimonio(params.pagamentoPatrimonioModel);
  }
}

class DeletePagamentoPatrimonio
    implements UseCase<PagamentoPatrimonio, Params> {
  final PagamentoPatrimonioRepository pagamentopatrimonioRepository;

  DeletePagamentoPatrimonio({@required this.pagamentopatrimonioRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return pagamentopatrimonioRepository
        .deletePagamentoPatrimonio(params.pagamentoPatrimonioModel.id);
  }
}
