import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/dependente.dart';
import '../../domain/usecases/dependente_usecases.dart';

part 'dependente_store.g.dart';

class StoreDependente = _StoreDependenteBase with _$StoreDependente;

abstract class _StoreDependenteBase with Store {
  final FindDependente findDependente;
  final ListDependente listDependente;
  final ListPageDependente listPageDependente;
  final SaveDependente saveDependente;
  final DeleteDependente deleteDependente;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  Dependente param = Dependente();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreDependenteBase({
    this.findDependente,
    this.listDependente,
    this.saveDependente,
    this.listPageDependente,
    this.deleteDependente,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeDependente(Dependente newDependente) => {
        param = Dependente(
          id: newDependente.id ?? param.id,
          pagadorId: newDependente.pagadorId ?? param.pagadorId,
          nome: newDependente.nome ?? param.nome,
        )
      };

  @observable
  Either<Failure, Dependente> resFind;

  void find(Dependente _dependente) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findDependente(Params(dependente: _dependente));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Dependente>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listDependente(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Dependente>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageDependente(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Dependente> resSave;

  void save(Dependente _dependente) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveDependente(Params(dependente: _dependente));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Dependente _dependente) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteDependente(Params(dependente: _dependente));
    setLoadState(EnumLoadState.loaded);
  }
}
