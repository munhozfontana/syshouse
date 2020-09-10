import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../data/models/pagador_model.dart';
import '../../domain/entities/pagador.dart';
import '../../domain/usecases/pagador_usecases.dart';
import 'utils/enum_load_state.dart';

part 'pagador_store.g.dart';

class StorePagador = _StorePagadorBase with _$StorePagador;

abstract class _StorePagadorBase with Store {
  final FindPagador findPagador;
  final ListPagador listPagador;
  final ListPagePagador listPagePagador;
  final SavePagador savePagador;
  final DeletePagador deletePagador;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  PagadorModel param = PagadorModel();

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
  void changePagador(PagadorModel newPagador) => {
        param = PagadorModel(
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

  void find(PagadorModel _pagadorModel) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findPagador(Params(pagadorModel: _pagadorModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Pagador>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listPagador(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Pagador>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPagePagador(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Pagador> resSave;

  void save(PagadorModel _pagadorModel) async {
    setLoadState(EnumLoadState.loading);
    resSave = await savePagador(Params(pagadorModel: _pagadorModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(PagadorModel _pagadorModel) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deletePagador(Params(pagadorModel: _pagadorModel));
    setLoadState(EnumLoadState.loaded);
  }
}
