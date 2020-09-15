import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/pagamento_model.dart';
import '../../domain/entities/pagamento.dart';
import '../../domain/usecases/pagamento_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'pagamento_store.g.dart';

class StorePagamento = _StorePagamentoBase with _$StorePagamento;

abstract class _StorePagamentoBase with Store {
  final FindPagamento findPagamento;
  final ListPagamento listPagamento;
  final ListPagePagamento listPagePagamento;
  final SavePagamento savePagamento;
  final DeletePagamento deletePagamento;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  PagamentoModel param = PagamentoModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StorePagamentoBase({
    this.findPagamento,
    this.listPagamento,
    this.savePagamento,
    this.listPagePagamento,
    this.deletePagamento,
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
  void changePagamento(PagamentoModel newPagamento) => {
        param = PagamentoModel(
          id: newPagamento.id ?? param.id,
          despesaId: newPagamento.despesaId ?? param.despesaId,
          valor: newPagamento.valor ?? param.valor,
          dataPagamento: newPagamento.dataPagamento ?? param.dataPagamento,
          obs: newPagamento.obs ?? param.obs,
        )
      };

  @observable
  Pagamento resFind = Pagamento();

  void find(PagamentoModel _pagamentoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findPagamento(Params(pagamentoModel: _pagamentoModel));
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
  List<Pagamento> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPagamento(NoParams());
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
  List<Pagamento> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPagePagamento(Params(pagination: pagination));

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
  Pagamento resSave = Pagamento();

  void save(PagamentoModel _pagamentoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await savePagamento(Params(pagamentoModel: _pagamentoModel));
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

  void delete(PagamentoModel _pagamentoModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deletePagamento(Params(pagamentoModel: _pagamentoModel));
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
