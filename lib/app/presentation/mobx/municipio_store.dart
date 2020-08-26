import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/municipio.dart';
import '../../domain/usecases/municipio_usecases.dart';

part 'municipio_store.g.dart';

class StoreMunicipio = _StoreMunicipioBase with _$StoreMunicipio;

abstract class _StoreMunicipioBase with Store {
  final FindMunicipio findMunicipio;
  final ListMunicipio listMunicipio;
  final ListPageMunicipio listPageMunicipio;
  final SaveMunicipio saveMunicipio;
  final DeleteMunicipio deleteMunicipio;

  @observable
  Municipio param = Municipio();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreMunicipioBase({
    this.findMunicipio,
    this.listMunicipio,
    this.saveMunicipio,
    this.listPageMunicipio,
    this.deleteMunicipio,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeMunicipio(Municipio newMunicipio) => {
        param = Municipio(
          id: newMunicipio.id ?? param.id,
          ibge: newMunicipio.ibge ?? param.ibge,
          nome: newMunicipio.nome ?? param.nome,
          uf: newMunicipio.uf ?? param.uf,
          pais: newMunicipio.pais ?? param.pais,
          populacao: newMunicipio.populacao ?? param.populacao,
        )
      };

  @observable
  Either<Failure, Municipio> resFind;

  void find(Municipio _municipio) async {
    resFind = await findMunicipio(Params(municipio: _municipio));
  }

  @observable
  Either<Failure, List<Municipio>> reslist;

  void list() async {
    reslist = await listMunicipio(NoParams());
  }

  @observable
  Either<Failure, List<Municipio>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage = await listPageMunicipio(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, Municipio> resSave;

  void save(Municipio _municipio) async {
    resSave = await saveMunicipio(Params(municipio: _municipio));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Municipio _municipio) async {
    resDelete = await deleteMunicipio(Params(municipio: _municipio));
  }
}
