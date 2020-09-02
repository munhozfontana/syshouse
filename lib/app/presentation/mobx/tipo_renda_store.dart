import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/tipo_renda.dart';
import '../../domain/usecases/tipo_renda_usecases.dart';

part 'tipo_renda_store.g.dart';

class StoreTipoRenda = _StoreTipoRendaBase with _$StoreTipoRenda;

abstract class _StoreTipoRendaBase with Store {
  final FindTipoRenda findTipoRenda;
  final ListTipoRenda listTipoRenda;
  final ListPageTipoRenda listPageTipoRenda;
  final SaveTipoRenda saveTipoRenda;
  final DeleteTipoRenda deleteTipoRenda;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  TipoRenda param = TipoRenda();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreTipoRendaBase({
    this.findTipoRenda,
    this.listTipoRenda,
    this.saveTipoRenda,
    this.listPageTipoRenda,
    this.deleteTipoRenda,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeTipoRenda(TipoRenda newTipoRenda) => {
        param = TipoRenda(
          id: newTipoRenda.id ?? param.id,
          descricao: newTipoRenda.descricao ?? param.descricao,
        )
      };

  @observable
  Either<Failure, TipoRenda> resFind;

  void find(TipoRenda _tiporenda) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findTipoRenda(Params(tipoRenda: _tiporenda));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<TipoRenda>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listTipoRenda(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<TipoRenda>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageTipoRenda(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, TipoRenda> resSave;

  void save(TipoRenda _tiporenda) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveTipoRenda(Params(tipoRenda: _tiporenda));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(TipoRenda _tiporenda) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteTipoRenda(Params(tipoRenda: _tiporenda));
    setLoadState(EnumLoadState.loaded);
  }
}
