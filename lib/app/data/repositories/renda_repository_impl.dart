import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/renda.dart';
import '../../domain/repositories/renda_repository.dart';
import '../datasources/renda_api.dart';
import 'utils/messages_repository.dart';

class RendaRepositoryImpl implements RendaRepository {
  final RendaApi rendaApi;
  final ConnectivityAdapter connectivityAdapter;

  RendaRepositoryImpl({
    @required this.rendaApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteRenda(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await rendaApi.delete(id));
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
  Future<Either<Failure, Renda>> findRenda(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await rendaApi.find(id),
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
  Future<Either<Failure, List<Renda>>> listRenda() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await rendaApi.list(),
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
  Future<Either<Failure, List<Renda>>> listPageRenda(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await rendaApi.listPage(page, size),
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
  Future<Either<Failure, Renda>> saveRenda(
    Renda body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await rendaApi.save(body),
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
