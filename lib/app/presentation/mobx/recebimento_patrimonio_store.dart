import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/recebimento_patrimonio.dart';
import '../../domain/usecases/recebimento_patrimonio_usecases.dart';

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
  RecebimentoPatrimonio param = RecebimentoPatrimonio();

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
          RecebimentoPatrimonio newRecebimentoPatrimonio) =>
      {
        param = RecebimentoPatrimonio(
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

  void find(RecebimentoPatrimonio _recebimentopatrimonio) async {
    resFind = await findRecebimentoPatrimonio(
        Params(recebimentopatrimonio: _recebimentopatrimonio));
  }

  @observable
  Either<Failure, List<RecebimentoPatrimonio>> reslist;

  void list() async {
    reslist = await listRecebimentoPatrimonio(NoParams());
  }

  @observable
  Either<Failure, List<RecebimentoPatrimonio>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage =
        await listPageRecebimentoPatrimonio(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, RecebimentoPatrimonio> resSave;

  void save(RecebimentoPatrimonio _recebimentopatrimonio) async {
    resSave = await saveRecebimentoPatrimonio(
        Params(recebimentopatrimonio: _recebimentopatrimonio));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(RecebimentoPatrimonio _recebimentopatrimonio) async {
    resDelete = await deleteRecebimentoPatrimonio(
        Params(recebimentopatrimonio: _recebimentopatrimonio));
  }
}
