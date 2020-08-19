import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/recebimento.dart';
import '../../domain/repositories/recebimento_repository.dart';
import '../datasources/recebimento_api.dart';
import 'utils/messages_repository.dart';

class RecebimentoRepositoryImpl implements RecebimentoRepository {
  final RecebimentoApi recebimentoApi;
  final ConnectivityAdapter connectivityAdapter;

  RecebimentoRepositoryImpl({
    @required this.recebimentoApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteRecebimento(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await recebimentoApi.delete(id));
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
  Future<Either<Failure, Recebimento>> findRecebimento(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await recebimentoApi.find(id),
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
  Future<Either<Failure, List<Recebimento>>> listRecebimento() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await recebimentoApi.list(),
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
  Future<Either<Failure, List<Recebimento>>> listPageRecebimento(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await recebimentoApi.listPage(page, size),
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
  Future<Either<Failure, Recebimento>> saveRecebimento(
    Recebimento body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await recebimentoApi.save(body),
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
