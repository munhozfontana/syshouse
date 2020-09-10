import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../data/models/recebimento_patrimonio_model.dart';
import '../../domain/entities/recebimento_patrimonio.dart';
import '../../domain/usecases/recebimento_patrimonio_usecases.dart';
import 'utils/enum_load_state.dart';

part 'recebimento_patrimonio_store.g.dart';

class StoreRecebimentoPatrimonio = _StoreRecebimentoPatrimonioBase
    with _$StoreRecebimentoPatrimonio;

abstract class _StoreRecebimentoPatrimonioBase with Store {
  final FindRecebimentoPatrimonio findRecebimentoPatrimonio;
  final ListRecebimentoPatrimonio listRecebimentoPatrimonio;
  final ListPageRecebimentoPatrimonio listPageRecebimentoPatrimonio;
  final SaveRecebimentoPatrimonio saveRecebimentoPatrimonio;
  final DeleteRecebimentoPatrimonio deleteRecebimentoPatrimonio;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  RecebimentoPatrimonioModel param = RecebimentoPatrimonioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreRecebimentoPatrimonioBase({
    this.findRecebimentoPatrimonio,
    this.listRecebimentoPatrimonio,
    this.saveRecebimentoPatrimonio,
    this.listPageRecebimentoPatrimonio,
    this.deleteRecebimentoPatrimonio,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeRecebimentoPatrimonio(
          RecebimentoPatrimonioModel newRecebimentoPatrimonio) =>
      {
        param = RecebimentoPatrimonioModel(
          id: newRecebimentoPatrimonio.id ?? param.id,
          recebimentoId:
              newRecebimentoPatrimonio.recebimentoId ?? param.recebimentoId,
          patrimonioId:
              newRecebimentoPatrimonio.patrimonioId ?? param.patrimonioId,
          valorCalculado:
              newRecebimentoPatrimonio.valorCalculado ?? param.valorCalculado,
        )
      };

  @observable
  Either<Failure, RecebimentoPatrimonio> resFind;

  void find(RecebimentoPatrimonioModel _recebimentopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findRecebimentoPatrimonio(
        Params(recebimentoPatrimonioModel: _recebimentopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<RecebimentoPatrimonio>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listRecebimentoPatrimonio(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<RecebimentoPatrimonio>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage =
        await listPageRecebimentoPatrimonio(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, RecebimentoPatrimonio> resSave;

  void save(RecebimentoPatrimonioModel _recebimentopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveRecebimentoPatrimonio(
        Params(recebimentoPatrimonioModel: _recebimentopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(RecebimentoPatrimonioModel _recebimentopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteRecebimentoPatrimonio(
        Params(recebimentoPatrimonioModel: _recebimentopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }
}
