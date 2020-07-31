import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/contato.dart';

abstract class ContatoRepository {
  Future<Either<Failure, Contato>> findContato(String id);

  Future<Either<Failure, Contato>> listAllContato();

  Future<Either<Failure, Contato>> listAllPageContato(int page, int size);

  Future<Either<Failure, Contato>> saveContato(Map<String, dynamic> body);

  Future<Either<Failure, Contato>> deleteContato(String id);
}
