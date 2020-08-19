import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:syshouse/app/data/repositories/utils/messages_repository.dart';
import 'package:syshouse/core/error/exceptions.dart';

import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/despesa.dart';
import '../../domain/repositories/despesa_repository.dart';
import '../datasources/despesa_api.dart';

class DespesaRepositoryImpl implements DespesaRepository {
  final DespesaApi despesaApi;
  final ConnectivityAdapter connectivityAdapter;

  DespesaRepositoryImpl({
    @required this.despesaApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteDespesa(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await despesaApi.delete(id));
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
  Future<Either<Failure, Despesa>> findDespesa(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await despesaApi.find(id),
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
  Future<Either<Failure, List<Despesa>>> listDespesa() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await despesaApi.list(),
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
  Future<Either<Failure, List<Despesa>>> listPageDespesa(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await despesaApi.listPage(page, size),
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
  Future<Either<Failure, Despesa>> saveDespesa(
    Despesa body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await despesaApi.save(body),
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
