import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

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
  PagamentoPatrimonio param = PagamentoPatrimonio();

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
  void changePagamentoPatrimonio(PagamentoPatrimonio newPagamentoPatrimonio) =>
      {
        param = PagamentoPatrimonio(
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

  void find(PagamentoPatrimonio _pagamentopatrimonio) async {
    resFind = await findPagamentoPatrimonio(
        Params(pagamentoPatrimonio: _pagamentopatrimonio));
  }

  @observable
  Either<Failure, List<PagamentoPatrimonio>> reslist;

  void list() async {
    reslist = await listPagamentoPatrimonio(NoParams());
  }

  @observable
  Either<Failure, List<PagamentoPatrimonio>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage =
        await listPagePagamentoPatrimonio(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, PagamentoPatrimonio> resSave;

  void save(PagamentoPatrimonio _pagamentopatrimonio) async {
    resSave = await savePagamentoPatrimonio(
        Params(pagamentoPatrimonio: _pagamentopatrimonio));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(PagamentoPatrimonio _pagamentopatrimonio) async {
    resDelete = await deletePagamentoPatrimonio(
        Params(pagamentoPatrimonio: _pagamentopatrimonio));
  }
}
