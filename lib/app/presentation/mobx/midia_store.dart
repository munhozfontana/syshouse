import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/midia.dart';
import '../../domain/usecases/midia_usecases.dart';

part 'midia_store.g.dart';

class StoreMidia = _StoreMidiaBase with _$StoreMidia;

abstract class _StoreMidiaBase with Store {
  final FindMidia findMidia;
  final ListMidia listMidia;
  final ListPageMidia listPageMidia;
  final SaveMidia saveMidia;
  final DeleteMidia deleteMidia;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  Midia param = Midia();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreMidiaBase({
    this.findMidia,
    this.listMidia,
    this.saveMidia,
    this.listPageMidia,
    this.deleteMidia,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeMidia(Midia newMidia) => {
        param = Midia(
          id: newMidia.id ?? param.id,
          patrimonioId: newMidia.patrimonioId ?? param.patrimonioId,
          nome: newMidia.nome ?? param.nome,
          caminho: newMidia.caminho ?? param.caminho,
          obs: newMidia.obs ?? param.obs,
          tipo: newMidia.tipo ?? param.tipo,
        )
      };

  @observable
  Either<Failure, Midia> resFind;

  void find(Midia _midia) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findMidia(Params(midia: _midia));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Midia>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listMidia(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Midia>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageMidia(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Midia> resSave;

  void save(Midia _midia) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveMidia(Params(midia: _midia));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Midia _midia) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteMidia(Params(midia: _midia));
    setLoadState(EnumLoadState.loaded);
  }
}
