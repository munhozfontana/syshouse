import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/contato.dart';
import '../repositories/contato_repository.dart';

class FindContato implements UseCase<Contato, Params> {
  final ContatoRepository contatoRepository;

  FindContato({@required this.contatoRepository});

  @override
  Future<Either<Failure, Contato>> call(Params params) {
    return contatoRepository.findContato(params.contatoModel.id);
  }
}

class ListContato implements UseCase<List<Contato>, NoParams> {
  final ContatoRepository contatoRepository;

  ListContato({@required this.contatoRepository});

  @override
  Future<Either<Failure, List<Contato>>> call(NoParams params) {
    return contatoRepository.listContato();
  }
}

class ListPageContato implements UseCase<List<Contato>, Params> {
  final ContatoRepository contatoRepository;

  ListPageContato({@required this.contatoRepository});

  @override
  Future<Either<Failure, List<Contato>>> call(Params params) {
    return contatoRepository.listPageContato(
      params.pagination.page,
      params.pagination.size,
    );
  }
}

class SaveContato implements UseCase<Contato, Params> {
  final ContatoRepository contatoRepository;

  SaveContato({@required this.contatoRepository});

  @override
  Future<Either<Failure, Contato>> call(Params params) {
    return contatoRepository.saveContato(params.contatoModel);
  }
}

class DeleteContato implements UseCase<Contato, Params> {
  final ContatoRepository contatoRepository;

  DeleteContato({@required this.contatoRepository});

  @override
  Future<Either<Failure, void>> call(Params params) {
    return contatoRepository.deleteContato(params.contatoModel.id);
  }
}
