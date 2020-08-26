import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

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
    resFind = await findSocio(Params(socio: _socio));
  }

  @observable
  Either<Failure, List<Socio>> reslist;

  void list() async {
    reslist = await listSocio(NoParams());
  }

  @observable
  Either<Failure, List<Socio>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage = await listPageSocio(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, Socio> resSave;

  void save(Socio _socio) async {
    resSave = await saveSocio(Params(socio: _socio));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Socio _socio) async {
    resDelete = await deleteSocio(Params(socio: _socio));
  }
}
