import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/tipo_renda.dart';
import '../../domain/repositories/tipo_renda_repository.dart';
import '../datasources/tipo_renda_api.dart';
import 'utils/messages_repository.dart';

class TipoRendaRepositoryImpl implements TipoRendaRepository {
  final TipoRendaApi tiporendaApi;
  final ConnectivityAdapter connectivityAdapter;

  TipoRendaRepositoryImpl({
    @required this.tiporendaApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteTipoRenda(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await tiporendaApi.delete(id));
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
  Future<Either<Failure, TipoRenda>> findTipoRenda(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tiporendaApi.find(id),
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
  Future<Either<Failure, List<TipoRenda>>> listTipoRenda() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tiporendaApi.list(),
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
  Future<Either<Failure, List<TipoRenda>>> listPageTipoRenda(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tiporendaApi.listPage(page, size),
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
  Future<Either<Failure, TipoRenda>> saveTipoRenda(
    TipoRenda body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tiporendaApi.save(body),
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
