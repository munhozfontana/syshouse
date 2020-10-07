import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/tipo_despesa.dart';
import '../../domain/repositories/tipo_despesa_repository.dart';
import '../datasources/tipo_despesa_api.dart';
import 'utils/messages_repository.dart';

class TipoDespesaRepositoryImpl implements TipoDespesaRepository {
  final TipoDespesaApi tipodespesaApi;
  final ConnectivityAdapter connectivityAdapter;

  TipoDespesaRepositoryImpl({
    @required this.tipodespesaApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteTipoDespesa(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await tipodespesaApi.delete(id));
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
  Future<Either<Failure, TipoDespesa>> findTipoDespesa(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tipodespesaApi.find(id),
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
  Future<Either<Failure, List<TipoDespesa>>> listTipoDespesa() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tipodespesaApi.list(),
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
  Future<Either<Failure, List<TipoDespesa>>> listPageTipoDespesa(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tipodespesaApi.listPage(page, size),
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
  Future<Either<Failure, TipoDespesa>> saveTipoDespesa(
    TipoDespesa body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await tipodespesaApi.save(body),
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
