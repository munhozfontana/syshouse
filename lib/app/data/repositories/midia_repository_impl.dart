import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/midia.dart';
import '../../domain/repositories/midia_repository.dart';
import '../datasources/midia_api.dart';
import 'utils/messages_repository.dart';

class MidiaRepositoryImpl implements MidiaRepository {
  final MidiaApi midiaApi;
  final ConnectivityAdapter connectivityAdapter;

  MidiaRepositoryImpl({
    @required this.midiaApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteMidia(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await midiaApi.delete(id));
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
  Future<Either<Failure, Midia>> findMidia(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await midiaApi.find(id),
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
  Future<Either<Failure, List<Midia>>> listMidia() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await midiaApi.list(),
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
  Future<Either<Failure, List<Midia>>> listPageMidia(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await midiaApi.listPage(page, size),
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
  Future<Either<Failure, Midia>> saveMidia(
    Midia body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await midiaApi.save(body),
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
