import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/contato.dart';
import '../../domain/repositories/contato_repository.dart';

class ContatoRepositoryImpl implements ContatoRepository {
  @override
  Future<Either<Failure, Contato>> deleteContato(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Contato>> findContato(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Contato>> listAllContato() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Contato>> listAllPageContato(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Contato>> saveContato(Map<String, dynamic> body) {
    throw UnimplementedError();
  }
}
