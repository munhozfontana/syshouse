import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/recebimento_model.dart';
import '../../domain/entities/recebimento.dart';
import '../../domain/usecases/recebimento_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'recebimento_store.g.dart';

class StoreRecebimento = _StoreRecebimentoBase with _$StoreRecebimento;

abstract class _StoreRecebimentoBase with Store {
  final FindRecebimento findRecebimento;
  final ListRecebimento listRecebimento;
  final ListPageRecebimento listPageRecebimento;
  final SaveRecebimento saveRecebimento;
  final DeleteRecebimento deleteRecebimento;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  RecebimentoModel param = RecebimentoModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreRecebimentoBase({
    this.findRecebimento,
    this.listRecebimento,
    this.saveRecebimento,
    this.listPageRecebimento,
    this.deleteRecebimento,
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
  void changeRecebimento(RecebimentoModel newRecebimento) => {
        param = RecebimentoModel(
          id: newRecebimento.id ?? param.id,
          rendaId: newRecebimento.rendaId ?? param.rendaId,
          valor: newRecebimento.valor ?? param.valor,
          dataRecebimento:
              newRecebimento.dataRecebimento ?? param.dataRecebimento,
          obs: newRecebimento.obs ?? param.obs,
        )
      };

  @observable
  Recebimento resFind = Recebimento();

  void find(RecebimentoModel _recebimentoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await findRecebimento(Params(recebimentoModel: _recebimentoModel));
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
  List<Recebimento> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listRecebimento(NoParams());
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
  List<Recebimento> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageRecebimento(Params(pagination: pagination));

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
  Recebimento resSave = Recebimento();

  void save(RecebimentoModel _recebimentoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await saveRecebimento(Params(recebimentoModel: _recebimentoModel));
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

  void delete(RecebimentoModel _recebimentoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await deleteRecebimento(Params(recebimentoModel: _recebimentoModel));
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
