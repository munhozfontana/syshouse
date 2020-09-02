import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/recebimento.dart';
import '../../domain/usecases/recebimento_usecases.dart';

part 'recebimento_store.g.dart';

class StoreRecebimento = _StoreRecebimentoBase with _$StoreRecebimento;

abstract class _StoreRecebimentoBase with Store {
  final FindRecebimento findRecebimento;
  final ListRecebimento listRecebimento;
  final ListPageRecebimento listPageRecebimento;
  final SaveRecebimento saveRecebimento;
  final DeleteRecebimento deleteRecebimento;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  Recebimento param = Recebimento();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreRecebimentoBase({
    this.findRecebimento,
    this.listRecebimento,
    this.saveRecebimento,
    this.listPageRecebimento,
    this.deleteRecebimento,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeRecebimento(Recebimento newRecebimento) => {
        param = Recebimento(
          id: newRecebimento.id ?? param.id,
          rendaId: newRecebimento.rendaId ?? param.rendaId,
          valor: newRecebimento.valor ?? param.valor,
          dataRecebimento:
              newRecebimento.dataRecebimento ?? param.dataRecebimento,
          obs: newRecebimento.obs ?? param.obs,
        )
      };

  @observable
  Either<Failure, Recebimento> resFind;

  void find(Recebimento _recebimento) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findRecebimento(Params(recebimento: _recebimento));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Recebimento>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listRecebimento(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Recebimento>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageRecebimento(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Recebimento> resSave;

  void save(Recebimento _recebimento) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveRecebimento(Params(recebimento: _recebimento));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Recebimento _recebimento) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteRecebimento(Params(recebimento: _recebimento));
    setLoadState(EnumLoadState.loaded);
  }
}
