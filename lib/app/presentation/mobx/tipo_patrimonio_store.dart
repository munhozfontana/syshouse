import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../data/models/tipo_patrimonio_model.dart';
import '../../domain/entities/tipo_patrimonio.dart';
import '../../domain/usecases/tipo_patrimonio_usecases.dart';
import 'utils/enum_load_state.dart';

part 'tipo_patrimonio_store.g.dart';

class StoreTipoPatrimonio = _StoreTipoPatrimonioBase with _$StoreTipoPatrimonio;

abstract class _StoreTipoPatrimonioBase with Store {
  final FindTipoPatrimonio findTipoPatrimonio;
  final ListTipoPatrimonio listTipoPatrimonio;
  final ListPageTipoPatrimonio listPageTipoPatrimonio;
  final SaveTipoPatrimonio saveTipoPatrimonio;
  final DeleteTipoPatrimonio deleteTipoPatrimonio;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  TipoPatrimonioModel param = TipoPatrimonioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreTipoPatrimonioBase({
    this.findTipoPatrimonio,
    this.listTipoPatrimonio,
    this.saveTipoPatrimonio,
    this.listPageTipoPatrimonio,
    this.deleteTipoPatrimonio,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeTipoPatrimonio(TipoPatrimonioModel newTipoPatrimonio) => {
        param = TipoPatrimonioModel(
          id: newTipoPatrimonio.id ?? param.id,
          descricao: newTipoPatrimonio.descricao ?? param.descricao,
        )
      };

  @observable
  Either<Failure, TipoPatrimonio> resFind;

  void find(TipoPatrimonioModel _tipopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findTipoPatrimonio(
        Params(tipoPatrimonioModel: _tipopatrimonioModel));
  }

  @observable
  Either<Failure, List<TipoPatrimonio>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listTipoPatrimonio(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<TipoPatrimonio>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageTipoPatrimonio(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, TipoPatrimonio> resSave;

  void save(TipoPatrimonioModel _tipopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveTipoPatrimonio(
        Params(tipoPatrimonioModel: _tipopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(TipoPatrimonioModel _tipopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteTipoPatrimonio(
        Params(tipoPatrimonioModel: _tipopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }
}
