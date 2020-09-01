import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/renda.dart';
import '../../domain/usecases/renda_usecases.dart';

part 'renda_store.g.dart';

class StoreRenda = _StoreRendaBase with _$StoreRenda;

abstract class _StoreRendaBase with Store {
  final FindRenda findRenda;
  final ListRenda listRenda;
  final ListPageRenda listPageRenda;
  final SaveRenda saveRenda;
  final DeleteRenda deleteRenda;

  @observable
  Renda param = Renda();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreRendaBase({
    this.findRenda,
    this.listRenda,
    this.saveRenda,
    this.listPageRenda,
    this.deleteRenda,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeRenda(Renda newRenda) => {
        param = Renda(
          id: newRenda.id ?? param.id,
          pagadorId: newRenda.pagadorId ?? param.pagadorId,
          tipoRendaId: newRenda.tipoRendaId ?? param.tipoRendaId,
          patrimonioId: newRenda.patrimonioId ?? param.patrimonioId,
          descricao: newRenda.descricao ?? param.descricao,
          valor: newRenda.valor ?? param.valor,
          vencimento: newRenda.vencimento ?? param.vencimento,
          dataInicio: newRenda.dataInicio ?? param.dataInicio,
          dataFim: newRenda.dataFim ?? param.dataFim,
          obs: newRenda.obs ?? param.obs,
        )
      };

  @observable
  Either<Failure, Renda> resFind;

  void find(Renda _renda) async {
    resFind = await findRenda(Params(renda: _renda));
  }

  @observable
  Either<Failure, List<Renda>> reslist;

  void list() async {
    reslist = await listRenda(NoParams());
  }

  @observable
  Either<Failure, List<Renda>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage = await listPageRenda(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, Renda> resSave;

  void save(Renda _renda) async {
    resSave = await saveRenda(Params(renda: _renda));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Renda _renda) async {
    resDelete = await deleteRenda(Params(renda: _renda));
  }
}