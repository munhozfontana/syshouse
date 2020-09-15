import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/socio_patrimonio_model.dart';
import '../../domain/entities/socio_patrimonio.dart';
import '../../domain/usecases/socio_patrimonio_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'socio_patrimonio_store.g.dart';

class StoreSocioPatrimonio = _StoreSocioPatrimonioBase
    with _$StoreSocioPatrimonio;

abstract class _StoreSocioPatrimonioBase with Store {
  final FindSocioPatrimonio findSocioPatrimonio;
  final ListSocioPatrimonio listSocioPatrimonio;
  final ListPageSocioPatrimonio listPageSocioPatrimonio;
  final SaveSocioPatrimonio saveSocioPatrimonio;
  final DeleteSocioPatrimonio deleteSocioPatrimonio;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  SocioPatrimonioModel param = SocioPatrimonioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreSocioPatrimonioBase({
    this.findSocioPatrimonio,
    this.listSocioPatrimonio,
    this.saveSocioPatrimonio,
    this.listPageSocioPatrimonio,
    this.deleteSocioPatrimonio,
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
  void changeSocioPatrimonio(SocioPatrimonioModel newSocioPatrimonio) => {
        param = SocioPatrimonioModel(
          id: newSocioPatrimonio.id ?? param.id,
          socioId: newSocioPatrimonio.socioId ?? param.socioId,
          patrimonioId: newSocioPatrimonio.patrimonioId ?? param.patrimonioId,
          porcentagem: newSocioPatrimonio.porcentagem ?? param.porcentagem,
          proprietario: newSocioPatrimonio.proprietario ?? param.proprietario,
        )
      };
  @observable
  SocioPatrimonio resFind = SocioPatrimonio();

  void find(SocioPatrimonioModel _sociopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findSocioPatrimonio(
        Params(socioPatrimonioModel: _sociopatrimonioModel));
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
  List<SocioPatrimonio> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listSocioPatrimonio(NoParams());
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
  List<SocioPatrimonio> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageSocioPatrimonio(Params(pagination: pagination));

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
  SocioPatrimonio resSave = SocioPatrimonio();

  void save(SocioPatrimonioModel _sociopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveSocioPatrimonio(
        Params(socioPatrimonioModel: _sociopatrimonioModel));
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

  void delete(SocioPatrimonioModel _sociopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteSocioPatrimonio(
        Params(socioPatrimonioModel: _sociopatrimonioModel));
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
