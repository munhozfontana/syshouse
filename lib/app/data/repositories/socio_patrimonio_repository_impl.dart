import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/socio_patrimonio.dart';
import '../../domain/repositories/socio_patrimonio_repository.dart';
import '../datasources/socio_patrimonio_api.dart';
import 'utils/messages_repository.dart';

class SocioPatrimonioRepositoryImpl implements SocioPatrimonioRepository {
  final SocioPatrimonioApi sociopatrimonioApi;
  final ConnectivityAdapter connectivityAdapter;

  SocioPatrimonioRepositoryImpl({
    @required this.sociopatrimonioApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteSocioPatrimonio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await sociopatrimonioApi.delete(id));
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
  Future<Either<Failure, SocioPatrimonio>> findSocioPatrimonio(
      String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await sociopatrimonioApi.find(id),
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
  Future<Either<Failure, List<SocioPatrimonio>>> listSocioPatrimonio() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await sociopatrimonioApi.list(),
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
  Future<Either<Failure, List<SocioPatrimonio>>> listPageSocioPatrimonio(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await sociopatrimonioApi.listPage(page, size),
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
  Future<Either<Failure, SocioPatrimonio>> saveSocioPatrimonio(
    SocioPatrimonio body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await sociopatrimonioApi.save(body),
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
