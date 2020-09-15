import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/renda_model.dart';
import '../../domain/entities/renda.dart';
import '../../domain/usecases/renda_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'renda_store.g.dart';

class StoreRenda = _StoreRendaBase with _$StoreRenda;

abstract class _StoreRendaBase with Store {
  final FindRenda findRenda;
  final ListRenda listRenda;
  final ListPageRenda listPageRenda;
  final SaveRenda saveRenda;
  final DeleteRenda deleteRenda;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  RendaModel param = RendaModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreRendaBase({
    this.findRenda,
    this.listRenda,
    this.saveRenda,
    this.listPageRenda,
    this.deleteRenda,
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
  void changeRenda(RendaModel newRenda) => {
        param = RendaModel(
          id: newRenda.id ?? param.id,
          pagadorId: newRenda.pagadorId ?? param.pagadorId,
          tipoRendaId: newRenda.tipoRendaId ?? param.tipoRendaId,
          patrimonioId: newRenda.patrimonioId ?? param.patrimonioId,
          descricao: newRenda.descricao ?? param.descricao,
          valor: newRenda.valor ?? param.valor,
          vencimento: newRenda.vencimento ?? param.vencimento,
          dataInicio: newRenda.dataInicio ?? param.dataInicio,
          dataFim: newRenda.dataFim ?? param.dataFim,
          obs: newRenda.obs ?? param.obs,
        )
      };

  @observable
  Renda resFind = Renda();

  void find(RendaModel _rendaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findRenda(Params(rendaModel: _rendaModel));
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
  List<Renda> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listRenda(NoParams());
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
  List<Renda> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageRenda(Params(pagination: pagination));

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
  Renda resSave = Renda();

  void save(RendaModel _rendaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveRenda(Params(rendaModel: _rendaModel));
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

  void delete(RendaModel _rendaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteRenda(Params(rendaModel: _rendaModel));
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
