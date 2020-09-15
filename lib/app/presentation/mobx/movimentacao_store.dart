import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/movimentacao_model.dart';
import '../../domain/entities/movimentacao.dart';
import '../../domain/usecases/movimentacao_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'movimentacao_store.g.dart';

class StoreMovimentacao = _StoreMovimentacaoBase with _$StoreMovimentacao;

abstract class _StoreMovimentacaoBase with Store {
  final FindMovimentacao findMovimentacao;
  final ListMovimentacao listMovimentacao;
  final ListPageMovimentacao listPageMovimentacao;
  final SaveMovimentacao saveMovimentacao;
  final DeleteMovimentacao deleteMovimentacao;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  MovimentacaoModel param = MovimentacaoModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreMovimentacaoBase({
    this.findMovimentacao,
    this.listMovimentacao,
    this.saveMovimentacao,
    this.listPageMovimentacao,
    this.deleteMovimentacao,
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
  void changeMovimentacao(MovimentacaoModel newMovimentacao) => {
        param = MovimentacaoModel(
          id: newMovimentacao.id ?? param.id,
          patrimonioOut: newMovimentacao.patrimonioOut ?? param.patrimonioOut,
          patrimonioIn: newMovimentacao.patrimonioIn ?? param.patrimonioIn,
          valor: newMovimentacao.valor ?? param.valor,
          data: newMovimentacao.data ?? param.data,
          obs: newMovimentacao.obs ?? param.obs,
        )
      };

  @observable
  Movimentacao resFind = Movimentacao();

  void find(MovimentacaoModel _movimentacaoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await findMovimentacao(Params(movimentacaoModel: _movimentacaoModel));
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
  List<Movimentacao> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listMovimentacao(NoParams());
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
  List<Movimentacao> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPageMovimentacao(Params(pagination: pagination));

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
  Movimentacao resSave = Movimentacao();

  void save(MovimentacaoModel _movimentacaoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await saveMovimentacao(Params(movimentacaoModel: _movimentacaoModel));
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

  void delete(MovimentacaoModel _movimentacaoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await deleteMovimentacao(Params(movimentacaoModel: _movimentacaoModel));
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
