import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/tipo_patrimonio_model.dart';
import '../../domain/entities/tipo_patrimonio.dart';
import '../../domain/usecases/tipo_patrimonio_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'tipo_patrimonio_store.g.dart';

class StoreTipoPatrimonio = _StoreTipoPatrimonioBase with _$StoreTipoPatrimonio;

abstract class _StoreTipoPatrimonioBase with Store {
  final FindTipoPatrimonio findTipoPatrimonio;
  final ListTipoPatrimonio listTipoPatrimonio;
  final ListPageTipoPatrimonio listPageTipoPatrimonio;
  final SaveTipoPatrimonio saveTipoPatrimonio;
  final DeleteTipoPatrimonio deleteTipoPatrimonio;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  TipoPatrimonioModel param = TipoPatrimonioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreTipoPatrimonioBase({
    this.findTipoPatrimonio,
    this.listTipoPatrimonio,
    this.saveTipoPatrimonio,
    this.listPageTipoPatrimonio,
    this.deleteTipoPatrimonio,
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
  void changeTipoPatrimonio(TipoPatrimonioModel newTipoPatrimonio) => {
        param = TipoPatrimonioModel(
          id: newTipoPatrimonio.id ?? param.id,
          descricao: newTipoPatrimonio.descricao ?? param.descricao,
        )
      };

  @observable
  TipoPatrimonio resFind = TipoPatrimonio();

  void find(TipoPatrimonioModel _tipopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findTipoPatrimonio(
        Params(tipoPatrimonioModel: _tipopatrimonioModel));
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
  List<TipoPatrimonio> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listTipoPatrimonio(NoParams());
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
  List<TipoPatrimonio> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageTipoPatrimonio(Params(pagination: pagination));

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
  TipoPatrimonio resSave = TipoPatrimonio();

  void save(TipoPatrimonioModel _tipopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveTipoPatrimonio(
        Params(tipoPatrimonioModel: _tipopatrimonioModel));
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

  void delete(TipoPatrimonioModel _tipopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteTipoPatrimonio(
        Params(tipoPatrimonioModel: _tipopatrimonioModel));
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
