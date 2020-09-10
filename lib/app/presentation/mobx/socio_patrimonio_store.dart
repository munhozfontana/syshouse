import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../data/models/socio_patrimonio_model.dart';
import '../../domain/entities/socio_patrimonio.dart';
import '../../domain/usecases/socio_patrimonio_usecases.dart';
import 'utils/enum_load_state.dart';

part 'socio_patrimonio_store.g.dart';

class StoreSocioPatrimonio = _StoreSocioPatrimonioBase
    with _$StoreSocioPatrimonio;

abstract class _StoreSocioPatrimonioBase with Store {
  final FindSocioPatrimonio findSocioPatrimonio;
  final ListSocioPatrimonio listSocioPatrimonio;
  final ListPageSocioPatrimonio listPageSocioPatrimonio;
  final SaveSocioPatrimonio saveSocioPatrimonio;
  final DeleteSocioPatrimonio deleteSocioPatrimonio;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  SocioPatrimonioModel param = SocioPatrimonioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreSocioPatrimonioBase({
    this.findSocioPatrimonio,
    this.listSocioPatrimonio,
    this.saveSocioPatrimonio,
    this.listPageSocioPatrimonio,
    this.deleteSocioPatrimonio,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeSocioPatrimonio(SocioPatrimonioModel newSocioPatrimonio) => {
        param = SocioPatrimonioModel(
          id: newSocioPatrimonio.id ?? param.id,
          socioId: newSocioPatrimonio.socioId ?? param.socioId,
          patrimonioId: newSocioPatrimonio.patrimonioId ?? param.patrimonioId,
          porcentagem: newSocioPatrimonio.porcentagem ?? param.porcentagem,
          proprietario: newSocioPatrimonio.proprietario ?? param.proprietario,
        )
      };

  @observable
  Either<Failure, SocioPatrimonio> resFind;

  void find(SocioPatrimonioModel _sociopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findSocioPatrimonio(
        Params(socioPatrimonioModel: _sociopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<SocioPatrimonio>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listSocioPatrimonio(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<SocioPatrimonio>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage =
        await listPageSocioPatrimonio(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, SocioPatrimonio> resSave;

  void save(SocioPatrimonioModel _sociopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveSocioPatrimonio(
        Params(socioPatrimonioModel: _sociopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(SocioPatrimonioModel _sociopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteSocioPatrimonio(
        Params(socioPatrimonioModel: _sociopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }
}
