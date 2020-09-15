import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/pagamento_patrimonio_model.dart';
import '../../domain/entities/pagamento_patrimonio.dart';
import '../../domain/usecases/pagamento_patrimonio_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'pagamento_patrimonio_store.g.dart';

class StorePagamentoPatrimonio = _StorePagamentoPatrimonioBase
    with _$StorePagamentoPatrimonio;

abstract class _StorePagamentoPatrimonioBase with Store {
  final FindPagamentoPatrimonio findPagamentoPatrimonio;
  final ListPagamentoPatrimonio listPagamentoPatrimonio;
  final ListPagePagamentoPatrimonio listPagePagamentoPatrimonio;
  final SavePagamentoPatrimonio savePagamentoPatrimonio;
  final DeletePagamentoPatrimonio deletePagamentoPatrimonio;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  PagamentoPatrimonioModel param = PagamentoPatrimonioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StorePagamentoPatrimonioBase({
    this.findPagamentoPatrimonio,
    this.listPagamentoPatrimonio,
    this.savePagamentoPatrimonio,
    this.listPagePagamentoPatrimonio,
    this.deletePagamentoPatrimonio,
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
  void changePagamentoPatrimonio(
          PagamentoPatrimonioModel newPagamentoPatrimonio) =>
      {
        param = PagamentoPatrimonioModel(
          id: newPagamentoPatrimonio.id ?? param.id,
          pagamentoId: newPagamentoPatrimonio.pagamentoId ?? param.pagamentoId,
          patrimonioId:
              newPagamentoPatrimonio.patrimonioId ?? param.patrimonioId,
          valorCalculado:
              newPagamentoPatrimonio.valorCalculado ?? param.valorCalculado,
        )
      };

  @observable
  PagamentoPatrimonio resFind = PagamentoPatrimonio();

  void find(PagamentoPatrimonioModel _pagamentopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findPagamentoPatrimonio(
        Params(pagamentoPatrimonioModel: _pagamentopatrimonioModel));
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
  List<PagamentoPatrimonio> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPagamentoPatrimonio(NoParams());
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
  List<PagamentoPatrimonio> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPagePagamentoPatrimonio(Params(pagination: pagination));

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
  PagamentoPatrimonio resSave = PagamentoPatrimonio();

  void save(PagamentoPatrimonioModel _pagamentopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await savePagamentoPatrimonio(
        Params(pagamentoPatrimonioModel: _pagamentopatrimonioModel));
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

  void delete(PagamentoPatrimonioModel _pagamentopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deletePagamentoPatrimonio(
        Params(pagamentoPatrimonioModel: _pagamentopatrimonioModel));
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
