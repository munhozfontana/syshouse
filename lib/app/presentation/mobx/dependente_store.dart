import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/dependente_model.dart';
import '../../domain/entities/dependente.dart';
import '../../domain/usecases/dependente_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';
import 'shared/show_error.dart';

part 'dependente_store.g.dart';

class StoreDependente = _StoreDependenteBase with _$StoreDependente;

abstract class _StoreDependenteBase with Store {
  final FindDependente findDependente;
  final ListDependente listDependente;
  final ListPageDependente listPageDependente;
  final SaveDependente saveDependente;
  final DeleteDependente deleteDependente;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  DependenteModel param = DependenteModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreDependenteBase({
    this.findDependente,
    this.listDependente,
    this.saveDependente,
    this.listPageDependente,
    this.deleteDependente,
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
  void changeDependente(DependenteModel newDependente) => {
        param = DependenteModel(
          id: newDependente.id ?? param.id,
          pagadorId: newDependente.pagadorId ?? param.pagadorId,
          nome: newDependente.nome ?? param.nome,
        )
      };

  @observable
  Dependente resFind = Dependente();

  void find(DependenteModel _dependenteModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findDependente(Params(dependenteModel: _dependenteModel));
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
  List<Dependente> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listDependente(NoParams());
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
  List<Dependente> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageDependente(Params(pagination: pagination));

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
  Dependente resSave = Dependente();

  void save(DependenteModel _dependenteModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveDependente(Params(dependenteModel: _dependenteModel));
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

  void delete(DependenteModel _dependenteModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteDependente(Params(dependenteModel: _dependenteModel));
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
