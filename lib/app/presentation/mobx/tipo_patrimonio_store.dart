import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/tipo_patrimonio.dart';
import '../../domain/usecases/tipo_patrimonio_usecases.dart';

part 'tipo_patrimonio_store.g.dart';

class StoreTipoPatrimonio = _StoreTipoPatrimonioBase with _$StoreTipoPatrimonio;

abstract class _StoreTipoPatrimonioBase with Store {
  final FindTipoPatrimonio findTipoPatrimonio;
  final ListTipoPatrimonio listTipoPatrimonio;
  final ListPageTipoPatrimonio listPageTipoPatrimonio;
  final SaveTipoPatrimonio saveTipoPatrimonio;
  final DeleteTipoPatrimonio deleteTipoPatrimonio;

  @observable
  TipoPatrimonio param = TipoPatrimonio();

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
  void changeTipoPatrimonio(TipoPatrimonio newTipoPatrimonio) => {
        param = TipoPatrimonio(
          id: newTipoPatrimonio.id ?? param.id,
          descricao: newTipoPatrimonio.descricao ?? param.descricao,
        )
      };

  @observable
  Either<Failure, TipoPatrimonio> resFind;

  void find(TipoPatrimonio _tipopatrimonio) async {
    resFind = await findTipoPatrimonio(Params(tipoPatrimonio: _tipopatrimonio));
  }

  @observable
  Either<Failure, List<TipoPatrimonio>> reslist;

  void list() async {
    reslist = await listTipoPatrimonio(NoParams());
  }

  @observable
  Either<Failure, List<TipoPatrimonio>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage = await listPageTipoPatrimonio(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, TipoPatrimonio> resSave;

  void save(TipoPatrimonio _tipopatrimonio) async {
    resSave = await saveTipoPatrimonio(Params(tipoPatrimonio: _tipopatrimonio));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(TipoPatrimonio _tipopatrimonio) async {
    resDelete =
        await deleteTipoPatrimonio(Params(tipoPatrimonio: _tipopatrimonio));
  }
}
