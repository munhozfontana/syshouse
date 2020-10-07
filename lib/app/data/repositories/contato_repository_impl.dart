import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/contato.dart';
import '../../domain/repositories/contato_repository.dart';
import '../datasources/contato_api.dart';
import 'utils/messages_repository.dart';

class ContatoRepositoryImpl implements ContatoRepository {
  final ContatoApi contatoApi;
  final ConnectivityAdapter connectivityAdapter;

  ContatoRepositoryImpl({
    @required this.contatoApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, void>> deleteContato(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await contatoApi.delete(id));
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
  Future<Either<Failure, Contato>> findContato(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await contatoApi.find(id),
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
  Future<Either<Failure, List<Contato>>> listContato() async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await contatoApi.list(),
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
  Future<Either<Failure, List<Contato>>> listPageContato(
    int page,
    int size,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await contatoApi.listPage(page, size),
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
  Future<Either<Failure, Contato>> saveContato(
    Contato body,
  ) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(
          await contatoApi.save(body),
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
