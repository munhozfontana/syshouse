import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/socio.dart';
import '../../domain/repositories/socio_repository.dart';
import '../datasources/socio_api.dart';
import 'utils/messages_repository.dart';

class SocioRepositoryImpl implements SocioRepository {
  final SocioApi socioApi;
  final ConnectivityAdapter connectivityAdapter;

  SocioRepositoryImpl({
    @required this.socioApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteSocio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await socioApi.delete(id));
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
  Future<Either<Failure, Socio>> findSocio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await socioApi.find(id),
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
  Future<Either<Failure, List<Socio>>> listSocio() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await socioApi.list(),
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
  Future<Either<Failure, List<Socio>>> listPageSocio(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await socioApi.listPage(page, size),
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
  Future<Either<Failure, Socio>> saveSocio(
    Socio body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await socioApi.save(body),
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
