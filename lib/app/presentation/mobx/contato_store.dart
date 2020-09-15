import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/contato_model.dart';
import '../../domain/entities/contato.dart';
import '../../domain/usecases/contato_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';
import 'shared/show_error.dart';

part 'contato_store.g.dart';

class StoreContato = _StoreContatoBase with _$StoreContato;

abstract class _StoreContatoBase with Store {
  final FindContato findContato;
  final ListContato listContato;
  final ListPageContato listPageContato;
  final SaveContato saveContato;
  final DeleteContato deleteContato;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  ContatoModel param = ContatoModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreContatoBase({
    this.findContato,
    this.listContato,
    this.saveContato,
    this.listPageContato,
    this.deleteContato,
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
  void changeContato(ContatoModel newContato) => {
        param = ContatoModel(
          email: newContato.email ?? param.email,
          id: newContato.id ?? param.id,
          pagadorId: newContato.pagadorId ?? param.pagadorId,
          fone: newContato.fone ?? param.fone,
          whatsapp: newContato.whatsapp ?? param.whatsapp,
        )
      };
  @observable
  Contato resFind = Contato();

  void find(ContatoModel _contatoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findContato(Params(contatoModel: _contatoModel));
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
  List<Contato> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listContato(NoParams());
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
  List<Contato> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageContato(Params(pagination: pagination));

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
  Contato resSave = Contato();

  void save(ContatoModel _contatoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveContato(Params(contatoModel: _contatoModel));
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

  void delete(ContatoModel _contatoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteContato(Params(contatoModel: _contatoModel));
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
