import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

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
    resFind = await findDespesa(Params(despesa: _despesa));
  }

  @observable
  Either<Failure, List<Despesa>> reslist;

  void list() async {
    reslist = await listDespesa(NoParams());
  }

  @observable
  Either<Failure, List<Despesa>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage = await listPageDespesa(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, Despesa> resSave;

  void save(Despesa _despesa) async {
    resSave = await saveDespesa(Params(despesa: _despesa));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Despesa _despesa) async {
    resDelete = await deleteDespesa(Params(despesa: _despesa));
  }
}
