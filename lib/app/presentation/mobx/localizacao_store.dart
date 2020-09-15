import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/localizacao_model.dart';
import '../../domain/entities/localizacao.dart';
import '../../domain/usecases/localizacao_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'localizacao_store.g.dart';

class StoreLocalizacao = _StoreLocalizacaoBase with _$StoreLocalizacao;

abstract class _StoreLocalizacaoBase with Store {
  final FindLocalizacao findLocalizacao;
  final ListLocalizacao listLocalizacao;
  final ListPageLocalizacao listPageLocalizacao;
  final SaveLocalizacao saveLocalizacao;
  final DeleteLocalizacao deleteLocalizacao;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  LocalizacaoModel param = LocalizacaoModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreLocalizacaoBase({
    this.findLocalizacao,
    this.listLocalizacao,
    this.saveLocalizacao,
    this.listPageLocalizacao,
    this.deleteLocalizacao,
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
  void changeLocalizacao(LocalizacaoModel newLocalizacao) => {
        param = LocalizacaoModel(
          id: newLocalizacao.id ?? param.id,
          endereco: newLocalizacao.endereco ?? param.endereco,
          bairro: newLocalizacao.bairro ?? param.bairro,
          cep: newLocalizacao.cep ?? param.cep,
          complemento: newLocalizacao.complemento ?? param.complemento,
          latitude: newLocalizacao.latitude ?? param.latitude,
          longitude: newLocalizacao.longitude ?? param.longitude,
          municipioId: newLocalizacao.municipioId ?? param.municipioId,
        )
      };

  @observable
  Localizacao resFind = Localizacao();

  void find(LocalizacaoModel _localizacaoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await findLocalizacao(Params(localizacaoModel: _localizacaoModel));
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
  List<Localizacao> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listLocalizacao(NoParams());
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
  List<Localizacao> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageLocalizacao(Params(pagination: pagination));

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
  Localizacao resSave = Localizacao();

  void save(LocalizacaoModel _localizacaoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await saveLocalizacao(Params(localizacaoModel: _localizacaoModel));
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

  void delete(LocalizacaoModel _localizacaoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await deleteLocalizacao(Params(localizacaoModel: _localizacaoModel));
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
