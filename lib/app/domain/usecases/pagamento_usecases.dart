import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/pagamento.dart';
import '../repositories/pagamento_repository.dart';

class FindPagamento implements UseCase<Pagamento, Params> {
  final PagamentoRepository pagamentoRepository;

  FindPagamento({@required this.pagamentoRepository});

  @override
  Future<Either<Failure, Pagamento>> call(Params params) {
    return pagamentoRepository.findPagamento(params.pagamento.id);
  }
}

class ListPagamento implements UseCase<List<Pagamento>, NoParams> {
  final PagamentoRepository pagamentoRepository;

  ListPagamento({@required this.pagamentoRepository});

  @override
  Future<Either<Failure, List<Pagamento>>> call(NoParams params) {
    return pagamentoRepository.listPagamento();
  }
}

class ListPagePagamento implements UseCase<List<Pagamento>, Params> {
  final PagamentoRepository pagamentoRepository;

  ListPagePagamento({@required this.pagamentoRepository});

  @override
  Future<Either<Failure, List<Pagamento>>> call(Params params) {
    return pagamentoRepository.listPagePagamento(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SavePagamento implements UseCase<Pagamento, Params> {
  final PagamentoRepository pagamentoRepository;

  SavePagamento({@required this.pagamentoRepository});

  @override
  Future<Either<Failure, Pagamento>> call(Params params) {
    return pagamentoRepository.savePagamento(params.pagamento);
  }
}

class DeletePagamento implements UseCase<Pagamento, Params> {
  final PagamentoRepository pagamentoRepository;

  DeletePagamento({@required this.pagamentoRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return pagamentoRepository.deletePagamento(params.pagamento.id);
  }
}
