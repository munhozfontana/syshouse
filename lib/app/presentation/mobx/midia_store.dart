import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/midia_model.dart';
import '../../domain/entities/midia.dart';
import '../../domain/usecases/midia_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'midia_store.g.dart';

class StoreMidia = _StoreMidiaBase with _$StoreMidia;

abstract class _StoreMidiaBase with Store {
  final FindMidia findMidia;
  final ListMidia listMidia;
  final ListPageMidia listPageMidia;
  final SaveMidia saveMidia;
  final DeleteMidia deleteMidia;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  MidiaModel param = MidiaModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreMidiaBase({
    this.findMidia,
    this.listMidia,
    this.saveMidia,
    this.listPageMidia,
    this.deleteMidia,
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
  void changeMidia(MidiaModel newMidia) => {
        param = MidiaModel(
          id: newMidia.id ?? param.id,
          patrimonioId: newMidia.patrimonioId ?? param.patrimonioId,
          nome: newMidia.nome ?? param.nome,
          caminho: newMidia.caminho ?? param.caminho,
          obs: newMidia.obs ?? param.obs,
          tipo: newMidia.tipo ?? param.tipo,
        )
      };

  @observable
  Midia resFind = Midia();

  void find(MidiaModel _midiaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findMidia(Params(midiaModel: _midiaModel));
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
  List<Midia> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listMidia(NoParams());
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
  List<Midia> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageMidia(Params(pagination: pagination));

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
  Midia resSave = Midia();

  void save(MidiaModel _midiaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveMidia(Params(midiaModel: _midiaModel));
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

  void delete(MidiaModel _midiaModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteMidia(Params(midiaModel: _midiaModel));
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
