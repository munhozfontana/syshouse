import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/dependente.dart';
import '../../domain/repositories/dependente_repository.dart';
import '../datasources/dependente_api.dart';
import 'utils/messages_repository.dart';

class DependenteRepositoryImpl implements DependenteRepository {
  final DependenteApi dependenteApi;
  final ConnectivityAdapter connectivityAdapter;

  DependenteRepositoryImpl({
    @required this.dependenteApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteDependente(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await dependenteApi.delete(id));
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
  Future<Either<Failure, Dependente>> findDependente(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await dependenteApi.find(id),
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
  Future<Either<Failure, List<Dependente>>> listDependente() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await dependenteApi.list(),
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
  Future<Either<Failure, List<Dependente>>> listPageDependente(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await dependenteApi.listPage(page, size),
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
  Future<Either<Failure, Dependente>> saveDependente(
    Dependente body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await dependenteApi.save(body),
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
