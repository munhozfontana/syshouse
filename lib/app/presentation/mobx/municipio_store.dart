import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

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
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  MunicipioModel param = MunicipioModel();

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
  void changeMunicipio(MunicipioModel newMunicipio) => {
        param = MunicipioModel(
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

  void find(MunicipioModel _municipioModel) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findMunicipio(Params(municipioModel: _municipioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Municipio>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listMunicipio(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Municipio>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageMunicipio(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Municipio> resSave;

  void save(MunicipioModel _municipioModel) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveMunicipio(Params(municipioModel: _municipioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(MunicipioModel _municipioModel) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteMunicipio(Params(municipioModel: _municipioModel));
    setLoadState(EnumLoadState.loaded);
  }
}
