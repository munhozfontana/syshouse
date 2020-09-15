import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/tipo_renda_model.dart';
import '../../domain/entities/tipo_renda.dart';
import '../../domain/usecases/tipo_renda_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'tipo_renda_store.g.dart';

class StoreTipoRenda = _StoreTipoRendaBase with _$StoreTipoRenda;

abstract class _StoreTipoRendaBase with Store {
  final FindTipoRenda findTipoRenda;
  final ListTipoRenda listTipoRenda;
  final ListPageTipoRenda listPageTipoRenda;
  final SaveTipoRenda saveTipoRenda;
  final DeleteTipoRenda deleteTipoRenda;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  TipoRendaModel param = TipoRendaModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreTipoRendaBase({
    this.findTipoRenda,
    this.listTipoRenda,
    this.saveTipoRenda,
    this.listPageTipoRenda,
    this.deleteTipoRenda,
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
  void changeTipoRenda(TipoRendaModel newTipoRenda) => {
        param = TipoRendaModel(
          id: newTipoRenda.id ?? param.id,
          descricao: newTipoRenda.descricao ?? param.descricao,
        )
      };

  @observable
  TipoRenda resFind = TipoRenda();

  void find(TipoRendaModel _tiporendaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findTipoRenda(Params(tipoRendaModel: _tiporendaModel));
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
  List<TipoRenda> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listTipoRenda(NoParams());
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
  List<TipoRenda> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageTipoRenda(Params(pagination: pagination));

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
  TipoRenda resSave = TipoRenda();

  void save(TipoRendaModel _tiporendaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveTipoRenda(Params(tipoRendaModel: _tiporendaModel));
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

  void delete(TipoRendaModel _tiporendaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteTipoRenda(Params(tipoRendaModel: _tiporendaModel));
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
