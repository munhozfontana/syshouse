import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/pagamento_patrimonio.dart';
import '../../domain/repositories/pagamento_patrimonio_repository.dart';
import '../datasources/pagamento_patrimonio_api.dart';
import 'utils/messages_repository.dart';

class PagamentoPatrimonioRepositoryImpl
    implements PagamentoPatrimonioRepository {
  final PagamentoPatrimonioApi pagamentopatrimonioApi;
  final ConnectivityAdapter connectivityAdapter;

  PagamentoPatrimonioRepositoryImpl({
    @required this.pagamentopatrimonioApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deletePagamentoPatrimonio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await pagamentopatrimonioApi.delete(id));
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
  Future<Either<Failure, PagamentoPatrimonio>> findPagamentoPatrimonio(
      String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagamentopatrimonioApi.find(id),
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
  Future<Either<Failure, List<PagamentoPatrimonio>>>
      listPagamentoPatrimonio() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagamentopatrimonioApi.list(),
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
  Future<Either<Failure, List<PagamentoPatrimonio>>>
      listPagePagamentoPatrimonio(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagamentopatrimonioApi.listPage(page, size),
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
  Future<Either<Failure, PagamentoPatrimonio>> savePagamentoPatrimonio(
    PagamentoPatrimonio body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagamentopatrimonioApi.save(body),
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
