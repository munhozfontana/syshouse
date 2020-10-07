import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/recebimento_patrimonio.dart';
import '../../domain/repositories/recebimento_patrimonio_repository.dart';
import '../datasources/recebimento_patrimonio_api.dart';
import 'utils/messages_repository.dart';

class RecebimentoPatrimonioRepositoryImpl
    implements RecebimentoPatrimonioRepository {
  final RecebimentoPatrimonioApi recebimentopatrimonioApi;
  final ConnectivityAdapter connectivityAdapter;

  RecebimentoPatrimonioRepositoryImpl({
    @required this.recebimentopatrimonioApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteRecebimentoPatrimonio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await recebimentopatrimonioApi.delete(id));
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
  Future<Either<Failure, RecebimentoPatrimonio>> findRecebimentoPatrimonio(
      String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await recebimentopatrimonioApi.find(id),
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
  Future<Either<Failure, List<RecebimentoPatrimonio>>>
      listRecebimentoPatrimonio() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await recebimentopatrimonioApi.list(),
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
  Future<Either<Failure, List<RecebimentoPatrimonio>>>
      listPageRecebimentoPatrimonio(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await recebimentopatrimonioApi.listPage(page, size),
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
  Future<Either<Failure, RecebimentoPatrimonio>> saveRecebimentoPatrimonio(
    RecebimentoPatrimonio body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await recebimentopatrimonioApi.save(body),
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
