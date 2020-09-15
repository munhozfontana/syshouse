import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/despesa_model.dart';
import '../../domain/entities/despesa.dart';
import '../../domain/usecases/despesa_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'despesa_store.g.dart';

class StoreDespesa = _StoreDespesaBase with _$StoreDespesa;

abstract class _StoreDespesaBase with Store {
  final FindDespesa findDespesa;
  final ListDespesa listDespesa;
  final ListPageDespesa listPageDespesa;
  final SaveDespesa saveDespesa;
  final DeleteDespesa deleteDespesa;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  DespesaModel param = DespesaModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreDespesaBase({
    this.findDespesa,
    this.listDespesa,
    this.saveDespesa,
    this.listPageDespesa,
    this.deleteDespesa,
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
  void changeDespesa(DespesaModel newDespesa) => {
        param = DespesaModel(
          id: newDespesa.id ?? param.id,
          tipoDespesaId: newDespesa.tipoDespesaId ?? param.tipoDespesaId,
          patrimonioId: newDespesa.patrimonioId ?? param.patrimonioId,
          descricao: newDespesa.descricao ?? param.descricao,
          valor: newDespesa.valor ?? param.valor,
          vencimento: newDespesa.vencimento ?? param.vencimento,
          dataInicio: newDespesa.dataInicio ?? param.dataInicio,
          dataFim: newDespesa.dataFim ?? param.dataFim,
          obs: newDespesa.obs ?? param.obs,
        )
      };

  @observable
  Despesa resFind = Despesa();

  void find(DespesaModel _despesaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findDespesa(Params(despesaModel: _despesaModel));
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
  List<Despesa> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listDespesa(NoParams());
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
  List<Despesa> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageDespesa(Params(pagination: pagination));

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
  Despesa resSave = Despesa();

  void save(DespesaModel _despesaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveDespesa(Params(despesaModel: _despesaModel));
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

  void delete(DespesaModel _despesaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteDespesa(Params(despesaModel: _despesaModel));
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
