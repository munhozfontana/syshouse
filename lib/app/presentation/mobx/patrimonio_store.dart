import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/usecases/params.dart';
import '../../data/models/patrimonio_model.dart';
import '../../domain/entities/patrimonio.dart';
import '../../domain/usecases/patrimonio_usecases.dart';
import 'shared/enuns/enum_load_state.dart';
import 'shared/loading_store.dart';

part 'patrimonio_store.g.dart';

class StorePatrimonio = _StorePatrimonioBase with _$StorePatrimonio;

abstract class _StorePatrimonioBase with Store {
  final FindPatrimonio findPatrimonio;
  final ListPatrimonio listPatrimonio;
  final ListPagePatrimonio listPagePatrimonio;
  final SavePatrimonio savePatrimonio;
  final DeletePatrimonio deletePatrimonio;
  final LoadingStore loadingStore;
  final ShowError showError;

  @observable
  PatrimonioModel param = PatrimonioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StorePatrimonioBase({
    this.findPatrimonio,
    this.listPatrimonio,
    this.savePatrimonio,
    this.listPagePatrimonio,
    this.deletePatrimonio,
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
  void changePatrimonio(PatrimonioModel newPatrimonio) => {
        param = PatrimonioModel(
          id: newPatrimonio.id ?? param.id,
          nome: newPatrimonio.nome ?? param.nome,
          valor: newPatrimonio.valor ?? param.valor,
          dataInicio: newPatrimonio.dataInicio ?? param.dataInicio,
          dataFim: newPatrimonio.dataFim ?? param.dataFim,
          tipoPatrimonioId:
              newPatrimonio.tipoPatrimonioId ?? param.tipoPatrimonioId,
          localizacaoId: newPatrimonio.localizacaoId ?? param.localizacaoId,
        )
      };

  @observable
  Patrimonio resFind = Patrimonio();

  void find(PatrimonioModel _patrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await findPatrimonio(Params(patrimonioModel: _patrimonioModel));
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
  List<Patrimonio> reslist = [];

  void list() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPatrimonio(NoParams());
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
  List<Patrimonio> reslistPage = [];

  void listPage() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await listPagePatrimonio(Params(pagination: pagination));

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
  Patrimonio resSave = Patrimonio();

  void save(PatrimonioModel _patrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await savePatrimonio(Params(patrimonioModel: _patrimonioModel));
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

  void delete(PatrimonioModel _patrimonioModel) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var res = await deletePatrimonio(Params(patrimonioModel: _patrimonioModel));
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
