import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/municipio_model.dart';
import '../../domain/entities/municipio.dart';
import '../../domain/usecases/municipio_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'municipio_store.g.dart';

class StoreMunicipio = _StoreMunicipioBase with _$StoreMunicipio;

abstract class _StoreMunicipioBase with Store {
  final FindMunicipio findMunicipio;
  final ListMunicipio listMunicipio;
  final ListPageMunicipio listPageMunicipio;
  final SaveMunicipio saveMunicipio;
  final DeleteMunicipio deleteMunicipio;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  MunicipioModel param = MunicipioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreMunicipioBase({
    this.findMunicipio,
    this.listMunicipio,
    this.saveMunicipio,
    this.listPageMunicipio,
    this.deleteMunicipio,
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
  void changeMunicipio(MunicipioModel newMunicipio) => {
        param = MunicipioModel(
          id: newMunicipio.id ?? param.id,
          ibge: newMunicipio.ibge ?? param.ibge,
          nome: newMunicipio.nome ?? param.nome,
          uf: newMunicipio.uf ?? param.uf,
          pais: newMunicipio.pais ?? param.pais,
          populacao: newMunicipio.populacao ?? param.populacao,
        )
      };

  @observable
  Municipio resFind = Municipio();

  void find(MunicipioModel _municipioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findMunicipio(Params(municipioModel: _municipioModel));
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
  List<Municipio> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listMunicipio(NoParams());
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
  List<Municipio> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageMunicipio(Params(pagination: pagination));

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
  Municipio resSave = Municipio();

  void save(MunicipioModel _municipioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveMunicipio(Params(municipioModel: _municipioModel));
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

  void delete(MunicipioModel _municipioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteMunicipio(Params(municipioModel: _municipioModel));
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
