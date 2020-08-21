import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/localizacao.dart';
import '../repositories/localizacao_repository.dart';

class FindLocalizacao implements UseCase<Localizacao, Params> {
  final LocalizacaoRepository localizacaoRepository;

  FindLocalizacao({@required this.localizacaoRepository});

  @override
  Future<Either<Failure, Localizacao>> call(Params params) {
    return localizacaoRepository.findLocalizacao(params.localizacao.id);
  }
}

class ListLocalizacao implements UseCase<List<Localizacao>, NoParams> {
  final LocalizacaoRepository localizacaoRepository;

  ListLocalizacao({@required this.localizacaoRepository});

  @override
  Future<Either<Failure, List<Localizacao>>> call(NoParams params) {
    return localizacaoRepository.listLocalizacao();
  }
}

class ListPageLocalizacao implements UseCase<List<Localizacao>, Params> {
  final LocalizacaoRepository localizacaoRepository;

  ListPageLocalizacao({@required this.localizacaoRepository});

  @override
  Future<Either<Failure, List<Localizacao>>> call(Params params) {
    return localizacaoRepository.listPageLocalizacao(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveLocalizacao implements UseCase<Localizacao, Params> {
  final LocalizacaoRepository localizacaoRepository;

  SaveLocalizacao({@required this.localizacaoRepository});

  @override
  Future<Either<Failure, Localizacao>> call(Params params) {
    return localizacaoRepository.saveLocalizacao(params.localizacao);
  }
}

class DeleteLocalizacao implements UseCase<Localizacao, Params> {
  final LocalizacaoRepository localizacaoRepository;

  DeleteLocalizacao({@required this.localizacaoRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return localizacaoRepository.deleteLocalizacao(params.localizacao.id);
  }
}
