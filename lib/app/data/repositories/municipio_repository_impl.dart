import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/municipio.dart';
import '../../domain/repositories/municipio_repository.dart';
import '../datasources/municipio_api.dart';
import 'utils/messages_repository.dart';

class MunicipioRepositoryImpl implements MunicipioRepository {
  final MunicipioApi municipioApi;
  final ConnectivityAdapter connectivityAdapter;

  MunicipioRepositoryImpl({
    @required this.municipioApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteMunicipio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await municipioApi.delete(id));
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
  Future<Either<Failure, Municipio>> findMunicipio(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await municipioApi.find(id),
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
  Future<Either<Failure, List<Municipio>>> listMunicipio() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await municipioApi.list(),
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
  Future<Either<Failure, List<Municipio>>> listPageMunicipio(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await municipioApi.listPage(page, size),
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
  Future<Either<Failure, Municipio>> saveMunicipio(
    Municipio body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await municipioApi.save(body),
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
