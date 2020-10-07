import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/pagador.dart';
import '../../domain/repositories/pagador_repository.dart';
import '../datasources/pagador_api.dart';
import 'utils/messages_repository.dart';

class PagadorRepositoryImpl implements PagadorRepository {
  final PagadorApi pagadorApi;
  final ConnectivityAdapter connectivityAdapter;

  PagadorRepositoryImpl({
    @required this.pagadorApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deletePagador(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await pagadorApi.delete(id));
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
  Future<Either<Failure, Pagador>> findPagador(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagadorApi.find(id),
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
  Future<Either<Failure, List<Pagador>>> listPagador() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagadorApi.list(),
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
  Future<Either<Failure, List<Pagador>>> listPagePagador(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagadorApi.listPage(page, size),
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
  Future<Either<Failure, Pagador>> savePagador(
    Pagador body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await pagadorApi.save(body),
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
