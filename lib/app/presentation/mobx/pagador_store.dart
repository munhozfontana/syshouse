import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/pagador_model.dart';
import '../../domain/entities/pagador.dart';
import '../../domain/usecases/pagador_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'pagador_store.g.dart';

class StorePagador = _StorePagadorBase with _$StorePagador;

abstract class _StorePagadorBase with Store {
  final FindPagador findPagador;
  final ListPagador listPagador;
  final ListPagePagador listPagePagador;
  final SavePagador savePagador;
  final DeletePagador deletePagador;
  final LoadingStore loadingStore;
  final ShowError showError;

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
    @required this.loadingStore,
    @required this.showError,
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
  Pagador resFind = Pagador();

  void find(PagadorModel _pagadorModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findPagador(Params(pagadorModel: _pagadorModel));
    res.fold(
      (l) {
        showError.setHasError(l);
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
      (r) {
        resFind = r;
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
    );
  }

  @observable
  List<Pagador> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPagador(NoParams());
    res.fold(
      (l) {
        showError.setHasError(l);
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
      (r) {
        reslist = r;
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
    );
  }

  @observable
  List<Pagador> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPagePagador(Params(pagination: pagination));

    res.fold(
      (l) {
        showError.setHasError(l);
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
      (r) {
        reslistPage = r;
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
    );
  }

  @observable
  Pagador resSave = Pagador();

  void save(PagadorModel _pagadorModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await savePagador(Params(pagadorModel: _pagadorModel));
    res.fold(
      (l) {
        showError.setHasError(l);
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
      (r) {
        resSave = r;
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
    );
  }

  void delete(PagadorModel _pagadorModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deletePagador(Params(pagadorModel: _pagadorModel));
    res.fold(
      (l) {
        showError.setHasError(l);
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
      (r) {
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
    );
  }
}
