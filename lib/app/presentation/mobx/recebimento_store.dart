import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

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
    resFind = await findRecebimento(Params(recebimento: _recebimento));
  }

  @observable
  Either<Failure, List<Recebimento>> reslist;

  void list() async {
    reslist = await listRecebimento(NoParams());
  }

  @observable
  Either<Failure, List<Recebimento>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage = await listPageRecebimento(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, Recebimento> resSave;

  void save(Recebimento _recebimento) async {
    resSave = await saveRecebimento(Params(recebimento: _recebimento));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Recebimento _recebimento) async {
    resDelete = await deleteRecebimento(Params(recebimento: _recebimento));
  }
}
