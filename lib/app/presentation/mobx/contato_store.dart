import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/contato.dart';
import '../../domain/usecases/contato_usecases.dart';

part 'contato_store.g.dart';

class StoreContato = _StoreContatoBase with _$StoreContato;

abstract class _StoreContatoBase with Store {
  final FindContato findContato;
  final ListContato listContato;
  final ListPageContato listPageContato;
  final SaveContato saveContato;
  final DeleteContato deleteContato;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  Contato param = Contato();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreContatoBase({
    this.findContato,
    this.listContato,
    this.saveContato,
    this.listPageContato,
    this.deleteContato,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeContato(Contato newContato) => {
        param = Contato(
          email: newContato.email ?? param.email,
          id: newContato.id ?? param.id,
          pagadorId: newContato.pagadorId ?? param.pagadorId,
          fone: newContato.fone ?? param.fone,
          socioId: newContato.socioId ?? param.socioId,
          whatsapp: newContato.whatsapp ?? param.whatsapp,
        )
      };

  @observable
  Either<Failure, Contato> resFind;

  void find(Contato _contato) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findContato(Params(contato: _contato));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Contato>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listContato(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Contato>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageContato(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Contato> resSave;

  void save(Contato _contato) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveContato(Params(contato: _contato));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Contato _contato) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteContato(Params(contato: _contato));
    setLoadState(EnumLoadState.loaded);
  }
}
