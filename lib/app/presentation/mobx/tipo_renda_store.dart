import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

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
    resFind = await findTipoRenda(Params(tipoRenda: _tiporenda));
  }

  @observable
  Either<Failure, List<TipoRenda>> reslist;

  void list() async {
    reslist = await listTipoRenda(NoParams());
  }

  @observable
  Either<Failure, List<TipoRenda>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage = await listPageTipoRenda(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, TipoRenda> resSave;

  void save(TipoRenda _tiporenda) async {
    resSave = await saveTipoRenda(Params(tipoRenda: _tiporenda));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(TipoRenda _tiporenda) async {
    resDelete = await deleteTipoRenda(Params(tipoRenda: _tiporenda));
  }
}
