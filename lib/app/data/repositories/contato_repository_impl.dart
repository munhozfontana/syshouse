import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:syshouse/core/error/exceptions.dart';

import '../../../core/error/failure.dart';
import '../../../core/network/connectivity_adapter.dart';
import '../../domain/entities/contato.dart';
import '../../domain/repositories/contato_repository.dart';
import '../datasources/utils/datasources_api.dart';

class ContatoRepositoryImpl implements ContatoRepository {
  final DatasourcesApi datasourcesApi;
  final ConnectivityAdapter connectivityAdapter;

  ContatoRepositoryImpl({
    @required this.datasourcesApi,
    @required this.connectivityAdapter,
  });

  @override
  Future<Either<Failure, Contato>> deleteContato(String id) async {
    return datasourcesApi.delete(id);
  }

  @override
  Future<Either<Failure, Contato>> findContato(String id) async {
    if (await connectivityAdapter.isConnected == true) {
      try {
        return Right(await datasourcesApi.find(id));
      } on ServerApiException catch (e) {
        return Left(ServerFailure(menssagem: e.error));
      }
    } else {
      return Left(ServerFailure(menssagem: "Sem conexão"));
    }
  }

  @override
  Future<Either<Failure, List<Contato>>> listContato() async {
    // return buildListRequest(datasourcesApi.list);
  }

  @override
  Future<Either<Failure, List<Contato>>> listPageContato(
    int page,
    int size,
  ) async {
    // return buildListRequest(() => datasourcesApi.listPage(page, size));
  }

  @override
  Future<Either<Failure, Contato>> saveContato(
    Contato body,
  ) async {
    return datasourcesApi.save(body);
  }

  // Future<Either<Failure, Object>> _buildRequestHelper(request()) async {
  //   if (await connectivityAdapter.isConnected == true) {
  //     try {
  //       return Right(await request());
  //     } on ServerApiException catch (e) {
  //       return Left(ServerFailure(menssagem: e.error));
  //     }
  //   } else {
  //     return Left(ServerFailure(menssagem: "Sem conexão"));
  //   }
  // }
}
