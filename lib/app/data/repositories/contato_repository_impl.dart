import 'package:dartz/dartz.dart';
import 'package:syshouse/app/domain/entities/contato.dart';
import 'package:syshouse/core/error/failure.dart';

import '../../domain/repositories/contato_repository.dart';

class ContatoRepositoryImpl implements ContatoRepository {
  @override
  Future<Either<Failure, Contato>> deleteContato(String id) {
    // TODO: implement deleteContato
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Contato>> findContato(String id) {
    // TODO: implement findContato
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Contato>>> listContato() {
    // TODO: implement listContato
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Contato>>> listPageContato(int page, int size) {
    // TODO: implement listPageContato
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Contato>> saveContato(Contato body) {
    // TODO: implement saveContato
    throw UnimplementedError();
  }
  // final ContatoApi
  // final ConnectivityAdapter connectivityAdapter;

  // ContatoRepositoryImpl({
  //   @required this.datasourcesApi,
  //   @required this.connectivityAdapter,
  // });

  // @override
  // Future<Either<Failure, Contato>> deleteContato(String id) async {
  //   if (await connectivityAdapter.isConnected == true) {
  //     try {
  //       return Right(await datasourcesApi.delete(id));
  //     } on ServerApiException catch (e) {
  //       return Left(ServerFailure(menssagem: e.error));
  //     }
  //   } else {
  //     return Left(ServerFailure(menssagem: "Sem conexão"));
  //   }
  // }

  // @override
  // Future<Either<Failure, Contato>> findContato(String id) async {
  //   if (await connectivityAdapter.isConnected == true) {
  //     try {
  //       return Right(await datasourcesApi.find(id));
  //     } on ServerApiException catch (e) {
  //       return Left(ServerFailure(menssagem: e.error));
  //     }
  //   } else {
  //     return Left(ServerFailure(menssagem: "Sem conexão"));
  //   }
  // }

  // @override
  // Future<Either<Failure, List<Contato>>> listContato() async {
  //   if (await connectivityAdapter.isConnected == true) {
  //     try {
  //       return Right(await datasourcesApi.list());
  //     } on ServerApiException catch (e) {
  //       return Left(ServerFailure(menssagem: e.error));
  //     }
  //   } else {
  //     return Left(ServerFailure(menssagem: "Sem conexão"));
  //   }
  // }

  // @override
  // Future<Either<Failure, List<Contato>>> listPageContato(
  //   int page,
  //   int size,
  // ) async {
  //   if (await connectivityAdapter.isConnected == true) {
  //     try {
  //       return Right(await datasourcesApi.listPage(page, size));
  //     } on ServerApiException catch (e) {
  //       return Left(ServerFailure(menssagem: e.error));
  //     }
  //   } else {
  //     return Left(ServerFailure(menssagem: "Sem conexão"));
  //   }
  // }

  // @override
  // Future<Either<Failure, Contato>> saveContato(
  //   Contato body,
  // ) async {
  //   if (await connectivityAdapter.isConnected == true) {
  //     try {
  //       return Right(await datasourcesApi.save(body));
  //     } on ServerApiException catch (e) {
  //       return Left(ServerFailure(menssagem: e.error));
  //     }
  //   } else {
  //     return Left(ServerFailure(menssagem: "Sem conexão"));
  //   }
  // }
}
