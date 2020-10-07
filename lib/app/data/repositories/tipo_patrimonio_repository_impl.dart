import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/tipo_patrimonio.dart';
import '../../domain/repositories/tipo_patrimonio_repository.dart';
import '../datasources/tipo_patrimonio_api.dart';
import 'utils/messages_repository.dart';

class TipoPatrimonioRepositoryImpl implements TipoPatrimonioRepository {
  final TipoPatrimonioApi tipopatrimonioApi;
  final ConnectivityAdapter connectivityAdapter;

  TipoPatrimonioRepositoryImpl({
    @required this.tipopatrimonioApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteTipoPatrimonio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await tipopatrimonioApi.delete(id));
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
  Future<Either<Failure, TipoPatrimonio>> findTipoPatrimonio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tipopatrimonioApi.find(id),
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
  Future<Either<Failure, List<TipoPatrimonio>>> listTipoPatrimonio() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tipopatrimonioApi.list(),
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
  Future<Either<Failure, List<TipoPatrimonio>>> listPageTipoPatrimonio(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tipopatrimonioApi.listPage(page, size),
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
  Future<Either<Failure, TipoPatrimonio>> saveTipoPatrimonio(
    TipoPatrimonio body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tipopatrimonioApi.save(body),
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
