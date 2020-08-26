import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/socio_patrimonio.dart';
import '../../domain/usecases/socio_patrimonio_usecases.dart';

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
  SocioPatrimonio param = SocioPatrimonio();

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
  void changeSocioPatrimonio(SocioPatrimonio newSocioPatrimonio) => {
        param = SocioPatrimonio(
          id: newSocioPatrimonio.id ?? param.id,
          socioId: newSocioPatrimonio.socioId ?? param.socioId,
          patrimonioId: newSocioPatrimonio.patrimonioId ?? param.patrimonioId,
          porcentagem: newSocioPatrimonio.porcentagem ?? param.porcentagem,
          proprietario: newSocioPatrimonio.proprietario ?? param.proprietario,
        )
      };

  @observable
  Either<Failure, SocioPatrimonio> resFind;

  void find(SocioPatrimonio _sociopatrimonio) async {
    resFind =
        await findSocioPatrimonio(Params(socioPatrimonio: _sociopatrimonio));
  }

  @observable
  Either<Failure, List<SocioPatrimonio>> reslist;

  void list() async {
    reslist = await listSocioPatrimonio(NoParams());
  }

  @observable
  Either<Failure, List<SocioPatrimonio>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage =
        await listPageSocioPatrimonio(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, SocioPatrimonio> resSave;

  void save(SocioPatrimonio _sociopatrimonio) async {
    resSave =
        await saveSocioPatrimonio(Params(socioPatrimonio: _sociopatrimonio));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(SocioPatrimonio _sociopatrimonio) async {
    resDelete =
        await deleteSocioPatrimonio(Params(socioPatrimonio: _sociopatrimonio));
  }
}
