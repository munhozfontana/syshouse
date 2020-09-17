import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/socio_model.dart';
import '../../domain/entities/socio.dart';
import '../../domain/usecases/socio_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';
import 'shared/show_error.dart';

part 'socio_store.g.dart';

class StoreSocio = _StoreSocioBase with _$StoreSocio;

abstract class _StoreSocioBase with Store {
  final FindSocio findSocio;
  final ListSocio listSocio;
  final ListPageSocio listPageSocio;
  final SaveSocio saveSocio;
  final DeleteSocio deleteSocio;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  SocioModel param = SocioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreSocioBase({
    this.findSocio,
    this.listSocio,
    this.saveSocio,
    this.listPageSocio,
    this.deleteSocio,
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
  void changeSocio(SocioModel newSocio) => {
        param = SocioModel(
          id: newSocio.id ?? param.id,
          nome: newSocio.nome ?? param.nome,
          cpf: newSocio.cpf ?? param.cpf,
          rg: newSocio.rg ?? param.rg,
          nacionalidade: newSocio.nacionalidade ?? param.nacionalidade,
          estadoCivil: newSocio.estadoCivil ?? param.estadoCivil,
          profissao: newSocio.profissao ?? param.profissao,
        ),
      };

  @observable
  Socio resFind = Socio();

  void find(SocioModel _socioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findSocio(Params(socioModel: _socioModel));
    res.fold(
      (l) {
        showError.setHasError(l);
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
      (r) {
        showError.resetError();
        resFind = r;
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
    );
  }

  @observable
  List<Socio> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listSocio(NoParams());
    res.fold(
      (l) {
        showError.setHasError(l);
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
      (r) {
        showError.resetError();
        reslist = r;
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
    );
  }

  @observable
  List<Socio> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageSocio(Params(pagination: pagination));
    res.fold(
      (l) {
        showError.setHasError(l);
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
      (r) {
        showError.resetError();
        reslistPage = r;
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
    );
  }

  @observable
  Socio resSave = Socio();

  void save(SocioModel _socioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveSocio(Params(socioModel: _socioModel));
    res.fold(
      (l) {
        showError.setHasError(l);
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
      (r) {
        showError.resetError();
        resSave = r;
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
    );
  }

  void delete(SocioModel _socioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteSocio(Params(socioModel: _socioModel));
    res.fold(
      (l) {
        showError.setHasError(l);
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
      (r) {
        showError.resetError();
        loadingStore.setLoadState(EnumLoadState.loaded);
      },
    );
  }
}
