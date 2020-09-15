import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/recebimento_patrimonio_model.dart';
import '../../domain/entities/recebimento_patrimonio.dart';
import '../../domain/usecases/recebimento_patrimonio_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'recebimento_patrimonio_store.g.dart';

class StoreRecebimentoPatrimonio = _StoreRecebimentoPatrimonioBase
    with _$StoreRecebimentoPatrimonio;

abstract class _StoreRecebimentoPatrimonioBase with Store {
  final FindRecebimentoPatrimonio findRecebimentoPatrimonio;
  final ListRecebimentoPatrimonio listRecebimentoPatrimonio;
  final ListPageRecebimentoPatrimonio listPageRecebimentoPatrimonio;
  final SaveRecebimentoPatrimonio saveRecebimentoPatrimonio;
  final DeleteRecebimentoPatrimonio deleteRecebimentoPatrimonio;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  RecebimentoPatrimonioModel param = RecebimentoPatrimonioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreRecebimentoPatrimonioBase({
    this.findRecebimentoPatrimonio,
    this.listRecebimentoPatrimonio,
    this.saveRecebimentoPatrimonio,
    this.listPageRecebimentoPatrimonio,
    this.deleteRecebimentoPatrimonio,
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
  void changeRecebimentoPatrimonio(
          RecebimentoPatrimonioModel newRecebimentoPatrimonio) =>
      {
        param = RecebimentoPatrimonioModel(
          id: newRecebimentoPatrimonio.id ?? param.id,
          recebimentoId:
              newRecebimentoPatrimonio.recebimentoId ?? param.recebimentoId,
          patrimonioId:
              newRecebimentoPatrimonio.patrimonioId ?? param.patrimonioId,
          valorCalculado:
              newRecebimentoPatrimonio.valorCalculado ?? param.valorCalculado,
        )
      };

  @observable
  RecebimentoPatrimonio resFind = RecebimentoPatrimonio();

  void find(RecebimentoPatrimonioModel _recebimentopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findRecebimentoPatrimonio(
        Params(recebimentoPatrimonioModel: _recebimentopatrimonioModel));
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
  List<RecebimentoPatrimonio> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listRecebimentoPatrimonio(NoParams());
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
  List<RecebimentoPatrimonio> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res =
        await listPageRecebimentoPatrimonio(Params(pagination: pagination));

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
  RecebimentoPatrimonio resSave = RecebimentoPatrimonio();

  void save(RecebimentoPatrimonioModel _recebimentopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await saveRecebimentoPatrimonio(
        Params(recebimentoPatrimonioModel: _recebimentopatrimonioModel));
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

  void delete(RecebimentoPatrimonioModel _recebimentopatrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deleteRecebimentoPatrimonio(
        Params(recebimentoPatrimonioModel: _recebimentopatrimonioModel));
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
