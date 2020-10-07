import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/localizacao.dart';
import '../../domain/repositories/localizacao_repository.dart';
import '../datasources/localizacao_api.dart';
import 'utils/messages_repository.dart';

class LocalizacaoRepositoryImpl implements LocalizacaoRepository {
  final LocalizacaoApi localizacaoApi;
  final ConnectivityAdapter connectivityAdapter;

  LocalizacaoRepositoryImpl({
    @required this.localizacaoApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteLocalizacao(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await localizacaoApi.delete(id));
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
  Future<Either<Failure, Localizacao>> findLocalizacao(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await localizacaoApi.find(id),
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
  Future<Either<Failure, List<Localizacao>>> listLocalizacao() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await localizacaoApi.list(),
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
  Future<Either<Failure, List<Localizacao>>> listPageLocalizacao(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await localizacaoApi.listPage(page, size),
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
  Future<Either<Failure, Localizacao>> saveLocalizacao(
    Localizacao body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await localizacaoApi.save(body),
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
