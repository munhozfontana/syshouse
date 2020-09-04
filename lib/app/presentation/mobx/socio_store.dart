import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/socio.dart';
import '../../domain/usecases/socio_usecases.dart';

part 'socio_store.g.dart';

class StoreSocio = _StoreSocioBase with _$StoreSocio;

abstract class _StoreSocioBase with Store {
  final FindSocio findSocio;
  final ListSocio listSocio;
  final ListPageSocio listPageSocio;
  final SaveSocio saveSocio;
  final DeleteSocio deleteSocio;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  Socio param = Socio();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreSocioBase({
    this.findSocio,
    this.listSocio,
    this.saveSocio,
    this.listPageSocio,
    this.deleteSocio,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeSocio(Socio newSocio) => {
        param = Socio(
          id: newSocio.id ?? param.id,
          nome: newSocio.nome ?? param.nome,
          cpf: newSocio.cpf ?? param.cpf,
          rg: newSocio.rg ?? param.rg,
          nacionalidade: newSocio.nacionalidade ?? param.nacionalidade,
          estadoCivil: newSocio.estadoCivil ?? param.estadoCivil,
          profissao: newSocio.profissao ?? param.profissao,
        )
      };

  @observable
  Either<Failure, Socio> resFind;

  void find(Socio _socio) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findSocio(Params(socio: _socio));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Socio>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listSocio(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Socio>> reslistPage;

  void listPage() async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageSocio(Params(pagination: pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Socio> resSave;

  void save(Socio _socio) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveSocio(Params(socio: _socio));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Socio _socio) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteSocio(Params(socio: _socio));
    setLoadState(EnumLoadState.loaded);
  }
}
