import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../data/models/tipo_despesa_model.dart';
import '../../domain/entities/tipo_despesa.dart';
import '../../domain/usecases/tipo_despesa_usecases.dart';
import 'utils/enum_load_state.dart';

part 'tipo_despesa_store.g.dart';

class StoreTipoDespesa = _StoreTipoDespesaBase with _$StoreTipoDespesa;

abstract class _StoreTipoDespesaBase with Store {
  final FindTipoDespesa findTipoDespesa;
  final ListTipoDespesa listTipoDespesa;
  final ListPageTipoDespesa listPageTipoDespesa;
  final SaveTipoDespesa saveTipoDespesa;
  final DeleteTipoDespesa deleteTipoDespesa;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  TipoDespesaModel param = TipoDespesaModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreTipoDespesaBase({
    this.findTipoDespesa,
    this.listTipoDespesa,
    this.saveTipoDespesa,
    this.listPageTipoDespesa,
    this.deleteTipoDespesa,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeTipoDespesa(TipoDespesaModel newTipoDespesa) => {
        param = TipoDespesaModel(
          id: newTipoDespesa.id ?? param.id,
          descricao: newTipoDespesa.descricao ?? param.descricao,
        )
      };

  @observable
  Either<Failure, TipoDespesa> resFind;

  void find(TipoDespesaModel _tipodespesaModel) async {
    setLoadState(EnumLoadState.loading);
    resFind =
        await findTipoDespesa(Params(tipoDespesaModel: _tipodespesaModel));
  }

  @observable
  Either<Failure, List<TipoDespesa>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listTipoDespesa(NoParams());
  }

  @observable
  Either<Failure, List<TipoDespesa>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageTipoDespesa(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, TipoDespesa> resSave;

  void save(TipoDespesaModel _tipodespesaModel) async {
    setLoadState(EnumLoadState.loading);
    resSave =
        await saveTipoDespesa(Params(tipoDespesaModel: _tipodespesaModel));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(TipoDespesaModel _tipodespesaModel) async {
    setLoadState(EnumLoadState.loading);
    resDelete =
        await deleteTipoDespesa(Params(tipoDespesaModel: _tipodespesaModel));
  }
}
