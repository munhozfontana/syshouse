import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/tipo_despesa.dart';
import '../../domain/usecases/tipo_despesa_usecases.dart';

part 'tipo_despesa_store.g.dart';

class StoreTipoDespesa = _StoreTipoDespesaBase with _$StoreTipoDespesa;

abstract class _StoreTipoDespesaBase with Store {
  final FindTipoDespesa findTipoDespesa;
  final ListTipoDespesa listTipoDespesa;
  final ListPageTipoDespesa listPageTipoDespesa;
  final SaveTipoDespesa saveTipoDespesa;
  final DeleteTipoDespesa deleteTipoDespesa;

  @observable
  TipoDespesa param = TipoDespesa();

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
  void changeTipoDespesa(TipoDespesa newTipoDespesa) => {
        param = TipoDespesa(
          id: newTipoDespesa.id ?? param.id,
          descricao: newTipoDespesa.descricao ?? param.descricao,
        )
      };

  @observable
  Either<Failure, TipoDespesa> resFind;

  void find(TipoDespesa _tipodespesa) async {
    resFind = await findTipoDespesa(Params(tipoDespesa: _tipodespesa));
  }

  @observable
  Either<Failure, List<TipoDespesa>> reslist;

  void list() async {
    reslist = await listTipoDespesa(NoParams());
  }

  @observable
  Either<Failure, List<TipoDespesa>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage = await listPageTipoDespesa(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, TipoDespesa> resSave;

  void save(TipoDespesa _tipodespesa) async {
    resSave = await saveTipoDespesa(Params(tipoDespesa: _tipodespesa));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(TipoDespesa _tipodespesa) async {
    resDelete = await deleteTipoDespesa(Params(tipoDespesa: _tipodespesa));
  }
}
