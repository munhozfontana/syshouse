import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/pagador.dart';
import '../repositories/pagador_repository.dart';

class FindPagador implements UseCase<Pagador, Params> {
  final PagadorRepository pagadorRepository;

  FindPagador({@required this.pagadorRepository});

  @override
  Future<Either<Failure, Pagador>> call(Params params) {
    return pagadorRepository.findPagador(params.pagadorModel.id);
  }
}

class ListPagador implements UseCase<List<Pagador>, NoParams> {
  final PagadorRepository pagadorRepository;

  ListPagador({@required this.pagadorRepository});

  @override
  Future<Either<Failure, List<Pagador>>> call(NoParams params) {
    return pagadorRepository.listPagador();
  }
}

class ListPagePagador implements UseCase<List<Pagador>, Params> {
  final PagadorRepository pagadorRepository;

  ListPagePagador({@required this.pagadorRepository});

  @override
  Future<Either<Failure, List<Pagador>>> call(Params params) {
    return pagadorRepository.listPagePagador(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SavePagador implements UseCase<Pagador, Params> {
  final PagadorRepository pagadorRepository;

  SavePagador({@required this.pagadorRepository});

  @override
  Future<Either<Failure, Pagador>> call(Params params) {
    return pagadorRepository.savePagador(params.pagadorModel);
  }
}

class DeletePagador implements UseCase<Pagador, Params> {
  final PagadorRepository pagadorRepository;

  DeletePagador({@required this.pagadorRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return pagadorRepository.deletePagador(params.pagadorModel.id);
  }
}
