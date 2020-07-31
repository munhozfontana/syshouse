import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/localizacao.dart';

abstract class LocalizacaoRepository {
  Future<Either<Failure, Localizacao>> findLocalizacao(String id);

  Future<Either<Failure, Localizacao>> listAllLocalizacao();

  Future<Either<Failure, Localizacao>> listAllPageLocalizacao(
      int page, int size);

  Future<Either<Failure, Localizacao>> saveLocalizacao(
      Map<String, dynamic> body);

  Future<Either<Failure, Localizacao>> deleteLocalizacao(String id);
}
