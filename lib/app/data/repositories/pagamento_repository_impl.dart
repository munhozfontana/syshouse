import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/pagamento.dart';
import '../../domain/repositories/pagamento_repository.dart';
import '../datasources/pagamento_api.dart';
import 'utils/messages_repository.dart';

class PagamentoRepositoryImpl implements PagamentoRepository {
  final PagamentoApi pagamentoApi;
  final ConnectivityAdapter connectivityAdapter;

  PagamentoRepositoryImpl({
    @required this.pagamentoApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deletePagamento(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await pagamentoApi.delete(id));
      } on ServerApiException catch (e) {
        return Left(
          ServerFailure(menssagem: e.error),
        );
      }
    } else {
      return Left(
        ServerFailure(menssagem: MessagesRepository.noConnection.value),
      );
    }
  }

  @override
  Future<Either<Failure, Pagamento>> findPagamento(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagamentoApi.find(id),
        );
      } on ServerApiException catch (e) {
        return Left(
          ServerFailure(menssagem: e.error),
        );
      }
    } else {
      return Left(
        ServerFailure(menssagem: MessagesRepository.noConnection.value),
      );
    }
  }

  @override
  Future<Either<Failure, List<Pagamento>>> listPagamento() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagamentoApi.list(),
        );
      } on ServerApiException catch (e) {
        return Left(
          ServerFailure(menssagem: e.error),
        );
      }
    } else {
      return Left(
        ServerFailure(menssagem: MessagesRepository.noConnection.value),
      );
    }
  }

  @override
  Future<Either<Failure, List<Pagamento>>> listPagePagamento(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagamentoApi.listPage(page, size),
        );
      } on ServerApiException catch (e) {
        return Left(
          ServerFailure(menssagem: e.error),
        );
      }
    } else {
      return Left(
        ServerFailure(menssagem: MessagesRepository.noConnection.value),
      );
    }
  }

  @override
  Future<Either<Failure, Pagamento>> savePagamento(
    Pagamento body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagamentoApi.save(body),
        );
      } on ServerApiException catch (e) {
        return Left(
          ServerFailure(menssagem: e.error),
        );
      }
    } else {
      return Left(
        ServerFailure(menssagem: MessagesRepository.noConnection.value),
      );
    }
  }
}
