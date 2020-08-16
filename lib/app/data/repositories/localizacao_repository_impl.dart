import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/localizacao.dart';
import '../../domain/repositories/localizacao_repository.dart';

class LocalizacaoRepositoryImpl implements LocalizacaoRepository {
  @override
  Future<Either<Failure, Localizacao>> deleteLocalizacao(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Localizacao>> findLocalizacao(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Localizacao>> listLocalizacao() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Localizacao>> listPageLocalizacao(int page, int size) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Localizacao>> saveLocalizacao(
      Map<String, Object> body) {
    throw UnimplementedError();
  }
}
