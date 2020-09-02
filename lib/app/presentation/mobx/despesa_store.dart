import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/despesa.dart';
import '../../domain/usecases/despesa_usecases.dart';

part 'despesa_store.g.dart';

class StoreDespesa = _StoreDespesaBase with _$StoreDespesa;

abstract class _StoreDespesaBase with Store {
  final FindDespesa findDespesa;
  final ListDespesa listDespesa;
  final ListPageDespesa listPageDespesa;
  final SaveDespesa saveDespesa;
  final DeleteDespesa deleteDespesa;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  Despesa param = Despesa();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreDespesaBase({
    this.findDespesa,
    this.listDespesa,
    this.saveDespesa,
    this.listPageDespesa,
    this.deleteDespesa,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeDespesa(Despesa newDespesa) => {
        param = Despesa(
          id: newDespesa.id ?? param.id,
          tipoDespesaId: newDespesa.tipoDespesaId ?? param.tipoDespesaId,
          patrimonioId: newDespesa.patrimonioId ?? param.patrimonioId,
          descricao: newDespesa.descricao ?? param.descricao,
          valor: newDespesa.valor ?? param.valor,
          vencimento: newDespesa.vencimento ?? param.vencimento,
          dataInicio: newDespesa.dataInicio ?? param.dataInicio,
          dataFim: newDespesa.dataFim ?? param.dataFim,
          obs: newDespesa.obs ?? param.obs,
        )
      };

  @observable
  Either<Failure, Despesa> resFind;

  void find(Despesa _despesa) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findDespesa(Params(despesa: _despesa));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Despesa>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listDespesa(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Despesa>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageDespesa(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Despesa> resSave;

  void save(Despesa _despesa) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveDespesa(Params(despesa: _despesa));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Despesa _despesa) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteDespesa(Params(despesa: _despesa));
    setLoadState(EnumLoadState.loaded);
  }
}
