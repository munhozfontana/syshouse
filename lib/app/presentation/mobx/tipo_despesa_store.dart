import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/tipo_despesa_model.dart';
import '../../domain/entities/tipo_despesa.dart';
import '../../domain/usecases/tipo_despesa_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'tipo_despesa_store.g.dart';

class StoreTipoDespesa = _StoreTipoDespesaBase with _$StoreTipoDespesa;

abstract class _StoreTipoDespesaBase with Store {
  final FindTipoDespesa findTipoDespesa;
  final ListTipoDespesa listTipoDespesa;
  final ListPageTipoDespesa listPageTipoDespesa;
  final SaveTipoDespesa saveTipoDespesa;
  final DeleteTipoDespesa deleteTipoDespesa;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  TipoDespesaModel param = TipoDespesaModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreTipoDespesaBase({
    this.findTipoDespesa,
    this.listTipoDespesa,
    this.saveTipoDespesa,
    this.listPageTipoDespesa,
    this.deleteTipoDespesa,
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
  void changeTipoDespesa(TipoDespesaModel newTipoDespesa) => {
        param = TipoDespesaModel(
          id: newTipoDespesa.id ?? param.id,
          descricao: newTipoDespesa.descricao ?? param.descricao,
        )
      };

  @observable
  TipoDespesa resFind = TipoDespesa();

  void find(TipoDespesaModel _tipodespesaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await findTipoDespesa(Params(tipoDespesaModel: _tipodespesaModel));
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
  List<TipoDespesa> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listTipoDespesa(NoParams());
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
  List<TipoDespesa> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageTipoDespesa(Params(pagination: pagination));

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
  TipoDespesa resSave = TipoDespesa();

  void save(TipoDespesaModel _tipodespesaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await saveTipoDespesa(Params(tipoDespesaModel: _tipodespesaModel));
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

  void delete(TipoDespesaModel _tipodespesaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await deleteTipoDespesa(Params(tipoDespesaModel: _tipodespesaModel));
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
