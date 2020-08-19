import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/localizacao.dart';

abstract class LocalizacaoRepository {
  Future<Either<Failure, Localizacao>> findLocalizacao(String id);

  Future<Either<Failure, List<Localizacao>>> listLocalizacao();

  Future<Either<Failure, List<Localizacao>>> listPageLocalizacao(
      int page, int size);

  Future<Either<Failure, Localizacao>> saveLocalizacao(Localizacao body);

  Future<Either<Failure, void>> deleteLocalizacao(String id);
}
