import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/patrimonio.dart';
import '../../domain/repositories/patrimonio_repository.dart';
import '../datasources/patrimonio_api.dart';
import 'utils/messages_repository.dart';

class PatrimonioRepositoryImpl implements PatrimonioRepository {
  final PatrimonioApi patrimonioApi;
  final ConnectivityAdapter connectivityAdapter;

  PatrimonioRepositoryImpl({
    @required this.patrimonioApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deletePatrimonio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await patrimonioApi.delete(id));
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
  Future<Either<Failure, Patrimonio>> findPatrimonio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await patrimonioApi.find(id),
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
  Future<Either<Failure, List<Patrimonio>>> listPatrimonio() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await patrimonioApi.list(),
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
  Future<Either<Failure, List<Patrimonio>>> listPagePatrimonio(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await patrimonioApi.listPage(page, size),
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
  Future<Either<Failure, Patrimonio>> savePatrimonio(
    Patrimonio body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await patrimonioApi.save(body),
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
