import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/data/models/pagamento_patrimonio_model.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/pagamento_patrimonio.dart';
import '../../domain/usecases/pagamento_patrimonio_usecases.dart';

part 'pagamento_patrimonio_store.g.dart';

class StorePagamentoPatrimonio = _StorePagamentoPatrimonioBase
    with _$StorePagamentoPatrimonio;

abstract class _StorePagamentoPatrimonioBase with Store {
  final FindPagamentoPatrimonio findPagamentoPatrimonio;
  final ListPagamentoPatrimonio listPagamentoPatrimonio;
  final ListPagePagamentoPatrimonio listPagePagamentoPatrimonio;
  final SavePagamentoPatrimonio savePagamentoPatrimonio;
  final DeletePagamentoPatrimonio deletePagamentoPatrimonio;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  PagamentoPatrimonioModel param = PagamentoPatrimonioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StorePagamentoPatrimonioBase({
    this.findPagamentoPatrimonio,
    this.listPagamentoPatrimonio,
    this.savePagamentoPatrimonio,
    this.listPagePagamentoPatrimonio,
    this.deletePagamentoPatrimonio,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changePagamentoPatrimonio(
          PagamentoPatrimonioModel newPagamentoPatrimonio) =>
      {
        param = PagamentoPatrimonioModel(
          id: newPagamentoPatrimonio.id ?? param.id,
          pagamentoId: newPagamentoPatrimonio.pagamentoId ?? param.pagamentoId,
          patrimonioId:
              newPagamentoPatrimonio.patrimonioId ?? param.patrimonioId,
          valorCalculado:
              newPagamentoPatrimonio.valorCalculado ?? param.valorCalculado,
        )
      };

  @observable
  Either<Failure, PagamentoPatrimonio> resFind;

  void find(PagamentoPatrimonioModel _pagamentopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findPagamentoPatrimonio(
        Params(pagamentoPatrimonioModel: _pagamentopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<PagamentoPatrimonio>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listPagamentoPatrimonio(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<PagamentoPatrimonio>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage =
        await listPagePagamentoPatrimonio(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, PagamentoPatrimonio> resSave;

  void save(PagamentoPatrimonioModel _pagamentopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resSave = await savePagamentoPatrimonio(
        Params(pagamentoPatrimonioModel: _pagamentopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(PagamentoPatrimonioModel _pagamentopatrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deletePagamentoPatrimonio(
        Params(pagamentoPatrimonioModel: _pagamentopatrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }
}
