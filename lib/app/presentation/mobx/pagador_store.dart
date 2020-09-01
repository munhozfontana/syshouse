import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/pagador.dart';
import '../../domain/usecases/pagador_usecases.dart';

part 'pagador_store.g.dart';

class StorePagador = _StorePagadorBase with _$StorePagador;

abstract class _StorePagadorBase with Store {
  final FindPagador findPagador;
  final ListPagador listPagador;
  final ListPagePagador listPagePagador;
  final SavePagador savePagador;
  final DeletePagador deletePagador;

  @observable
  Pagador param = Pagador();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StorePagadorBase({
    this.findPagador,
    this.listPagador,
    this.savePagador,
    this.listPagePagador,
    this.deletePagador,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changePagador(Pagador newPagador) => {
        param = Pagador(
          id: newPagador.id ?? param.id,
          nome: newPagador.nome ?? param.nome,
          nascimento: newPagador.nascimento ?? param.nascimento,
          cpf: newPagador.cpf ?? param.cpf,
          rg: newPagador.rg ?? param.rg,
          cnpj: newPagador.cnpj ?? param.cnpj,
          nacionalidade: newPagador.nacionalidade ?? param.nacionalidade,
          estadoCivil: newPagador.estadoCivil ?? param.estadoCivil,
          profissao: newPagador.profissao ?? param.profissao,
          endereco: newPagador.endereco ?? param.endereco,
        )
      };

  @observable
  Either<Failure, Pagador> resFind;

  void find(Pagador _pagador) async {
    resFind = await findPagador(Params(pagador: _pagador));
  }

  @observable
  Either<Failure, List<Pagador>> reslist;

  void list() async {
    reslist = await listPagador(NoParams());
  }

  @observable
  Either<Failure, List<Pagador>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage = await listPagePagador(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, Pagador> resSave;

  void save(Pagador _pagador) async {
    resSave = await savePagador(Params(pagador: _pagador));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Pagador _pagador) async {
    resDelete = await deletePagador(Params(pagador: _pagador));
  }
}