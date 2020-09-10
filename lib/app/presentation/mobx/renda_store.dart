import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../data/models/renda_model.dart';
import '../../domain/entities/renda.dart';
import '../../domain/usecases/renda_usecases.dart';
import 'utils/enum_load_state.dart';

part 'renda_store.g.dart';

class StoreRenda = _StoreRendaBase with _$StoreRenda;

abstract class _StoreRendaBase with Store {
  final FindRenda findRenda;
  final ListRenda listRenda;
  final ListPageRenda listPageRenda;
  final SaveRenda saveRenda;
  final DeleteRenda deleteRenda;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  RendaModel param = RendaModel();

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
  void changeRenda(RendaModel newRenda) => {
        param = RendaModel(
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

  void find(RendaModel _rendaModel) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findRenda(Params(rendaModel: _rendaModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Renda>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listRenda(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Renda>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageRenda(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Renda> resSave;

  void save(RendaModel _rendaModel) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveRenda(Params(rendaModel: _rendaModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(RendaModel _rendaModel) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteRenda(Params(rendaModel: _rendaModel));
    setLoadState(EnumLoadState.loaded);
  }
}
