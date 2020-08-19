import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/movimentacao.dart';
import '../../domain/repositories/movimentacao_repository.dart';
import '../datasources/movimentacao_api.dart';
import 'utils/messages_repository.dart';

class MovimentacaoRepositoryImpl implements MovimentacaoRepository {
  final MovimentacaoApi movimentacaoApi;
  final ConnectivityAdapter connectivityAdapter;

  MovimentacaoRepositoryImpl({
    @required this.movimentacaoApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteMovimentacao(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await movimentacaoApi.delete(id));
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
  Future<Either<Failure, Movimentacao>> findMovimentacao(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await movimentacaoApi.find(id),
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
  Future<Either<Failure, List<Movimentacao>>> listMovimentacao() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await movimentacaoApi.list(),
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
  Future<Either<Failure, List<Movimentacao>>> listPageMovimentacao(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await movimentacaoApi.listPage(page, size),
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
  Future<Either<Failure, Movimentacao>> saveMovimentacao(
    Movimentacao body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await movimentacaoApi.save(body),
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
